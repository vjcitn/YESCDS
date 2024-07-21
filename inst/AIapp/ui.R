library(shiny)
library(devtools)
ui = fluidPage(
 sidebarLayout(
  sidebarPanel(
   helpText("AI demo for YES 4 CURE"),
   helpText("This app uses a BERT pipeline to produce scores for sentence completions."),
   textInput("in1", "text", "The capital of Spain is [MASK]."),
   actionButton("query", "fill mask!")
   ),
  mainPanel(
   tabsetPanel(
    tabPanel("basic", verbatimTextOutput("stuff")),
    tabPanel("about", helpText("This app demonstrates the use of BertMaskedLM as defined in the
transformers python package from huggingface.co."),
    helpText("The", a("model card", href=
     "https://huggingface.co/google-bert/bert-base-uncased", target="_blank"), "provides references and variations." ),
    helpText("The code underlying the LLM usage is in a", a("gist.", 
      href="https://gist.github.com/vjcitn/0e1b0289eb1a219b98d60b5b863f8d62", target="_blank")),
    helpText("The approach here uses the", a("FillMask", href="https://huggingface.co/docs/transformers/v4.42.0/en/main_classes/pipelines#transformers.FillMaskPipeline"), "pipeline, which is a member of a", a("family", href=
   "https://huggingface.co/docs/transformers/en/main_classes/pipelines#transformers.pipeline", target="_blank"),  "of pipelines for generative tasks including image and audio classification."),
    helpText("Information about the infrastructure produced in order to operate Bert is in this", a("gist.",
href="https://gist.github.com/vjcitn/4bd8978e61779ecda7f74708708609c4", target="_blank")))
   )
  )
 )
)
