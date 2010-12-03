#include <ntddk.h> 
#include <winddk.h> 
#include "fina.h"

static struct FINA_State state;
extern unsigned char * g_buf;
extern unsigned g_curr;
extern unsigned g_bufsz;
extern unsigned char g_outbuf[];
extern unsigned g_outcurr;

static void DDKAPI unload(PDRIVER_OBJECT d) {
	UNICODE_STRING dosname;
	FINA_End(&state);
	RtlInitUnicodeString(&dosname, L"\\DosDevices\\FINA");
	IoDeleteSymbolicLink(&dosname);
	IoDeleteDevice(d->DeviceObject);
}

static NTSTATUS DDKAPI finacreate(PDEVICE_OBJECT d, PIRP i) {
	return STATUS_SUCCESS;
}

static NTSTATUS DDKAPI finaclose(PDEVICE_OBJECT d, PIRP i) {
	return STATUS_SUCCESS;
}

static unsigned umin(unsigned a, unsigned b) {
	return a < b? a : b;
}

static NTSTATUS DDKAPI finaread(PDEVICE_OBJECT d, PIRP i) {
	NTSTATUS status = STATUS_SUCCESS;
	PIO_STACK_LOCATION sl = IoGetCurrentIrpStackLocation(i);
	unsigned sz = umin(sl->Parameters.Read.Length, g_outcurr);
	RtlCopyMemory(i->AssociatedIrp.SystemBuffer, g_outbuf, sz);
	g_outcurr = 0;
	i->IoStatus.Status = status;
	i->IoStatus.Information = sz;
	IoCompleteRequest(i, IO_NO_INCREMENT);
	return status;
}

static NTSTATUS DDKAPI finawrite(PDEVICE_OBJECT d, PIRP i) 
{
	NTSTATUS status = STATUS_SUCCESS;
	void * buf;
	unsigned sz;
	PIO_STACK_LOCATION sl = IoGetCurrentIrpStackLocation(i);
	sz = sl->Parameters.Write.Length;
	g_buf = i->AssociatedIrp.SystemBuffer;
	g_curr = 0;
	g_bufsz = sz;
	FINA_Tick(&state);
	i->IoStatus.Status = STATUS_SUCCESS;
	i->IoStatus.Information = g_curr;
	IoCompleteRequest(i, IO_NO_INCREMENT);
	return status;
}

NTSTATUS DDKAPI DriverEntry(PDRIVER_OBJECT d, PUNICODE_STRING RegistryPath) {
	int argc = 1;
	char * argv[] = {"fina.sys", NULL};
	UNICODE_STRING ntname;
	UNICODE_STRING dosname;
	PDEVICE_OBJECT dobj;

	d->DriverUnload = unload;
	d->MajorFunction[IRP_MJ_CREATE] = finacreate;
	d->MajorFunction[IRP_MJ_CLOSE] = finaclose;
	d->MajorFunction[IRP_MJ_READ] = finaread;
	d->MajorFunction[IRP_MJ_WRITE] = finawrite;

	RtlInitUnicodeString(&ntname, L"\\Device\\FINA");

	IoCreateDevice(d, 0, &ntname, FILE_DEVICE_UNKNOWN, 0, FALSE, &dobj);
	dobj->Flags |= DO_BUFFERED_IO;
  
	RtlInitUnicodeString(&dosname, L"\\DosDevices\\FINA"); 
	IoCreateSymbolicLink(&dosname, &ntname);
	FINA_Init(&state, argc, argv);
	FINA_Tick(&state);
	return STATUS_SUCCESS;
}
