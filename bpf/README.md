
# Business Process Flows (BPF) — Import & Configuration

These files are templates describing the stages and required fields for three BPFs.
Recreate them in the Maker Portal or import via solution editor by creating new BPFs
and copying stage/field logic.

Included BPFs:
1. HMS_Outpatient_Visit_BPF (primary entity: hms_encounter)
   Stages: Intake → Triage → Consultation → Orders → Discharge → Follow-up
2. HMS_Billing_Claim_BPF (primary entity: hms_invoice)
   Stages: Code & Charge Capture → Invoice Creation → Claim Submission → Remittance
3. HMS_Referral_Management_BPF (primary entity: hms_referral)
   Stages: Referral Received → Scheduling → Consult Completed → Feedback to Referrer

## How to build in Maker Portal
1. In your Solution, click **New > Automation > Process > Business process flow**.
2. Select the **Primary table** as indicated above.
3. Add stages and **Data Steps** matching the `stages` arrays in the JSON files.
4. Use **Workflow/Flow (On stage entry/exit)** to trigger creating related rows:
   - On **Intake → Triage**: create `hms_encounter` linked to Appointment & Patient.
   - On **Orders**: optional cloud flow to create lab/med orders.
   - On **Discharge**: create Follow-up Appointment (if needed).
5. Add **Security Roles** that can run the BPF (Admin, Provider, Front Desk, Billing as appropriate).
6. **Activate** the BPF and set **Order** if multiple BPFs apply to the same table.
