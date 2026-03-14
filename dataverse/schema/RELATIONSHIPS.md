
# Relationships (high level)

- hms_Patient 1—N hms_Encounter
- hms_Patient 1—N hms_Appointment
- hms_Provider 1—N hms_Appointment
- hms_Encounter 1—N hms_Diagnosis
- hms_Encounter 1—N hms_MedicationOrder
- hms_Encounter 1—N hms_LabOrder
- hms_LabOrder 1—N hms_LabResult
- hms_Patient 1—N hms_InsurancePolicy
- hms_Encounter N—1 hms_Claim (or Invoice→Claim path)
- hms_Invoice 1—N hms_InvoiceLine
- hms_CarePlan 1—N hms_CarePlanTask
- hms_Patient 1—N hms_Referral
- hms_Message N—1 hms_Patient and N—1 hms_Provider
- Reference: hms_Facility, hms_Room, hms_Service, hms_Document
- New: hms_Patient 1—N hms_CarePlan; hms_Referral N—1 hms_Appointment (optional)
