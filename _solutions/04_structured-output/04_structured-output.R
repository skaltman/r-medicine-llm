library(ellmer)

source(here::here("data/clinical-notes.R"))

type_patient <- type_object(
  name = type_string("Patient's full name"),
  age = type_integer("Patient's age in years"),
  sex = type_string("Patient's sex (Male or Female)"),
  diagnoses = type_array(type_string("A diagnosis or condition")),
  medications = type_array(
    type_object(
      name = type_string("Medication name"),
      dose = type_string("Dosage amount"),
      frequency = type_string("How often the medication is taken")
    )
  )
)

chat <- chat("anthropic/claude-haiku-4-5")

chat$chat_structured(clinical_notes[[1]], type = type_patient)

notes_df <-
  parallel_chat_structured(
    chat,
    prompts = clinical_notes,
    type = type_patient
  )
