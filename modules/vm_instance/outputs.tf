output "vm_instance_name" {
  description = "The name of the VM instance."
  value       = google_compute_instance.vm_instance.name
}
