{
	"contents": {
		"397ba091-82c5-4528-a8a1-6d4c1a705a57": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "ats.app.mainworkflow",
			"subject": "MainWorkflow",
			"name": "MainWorkflow",
			"documentation": "Main Workflow reference sub",
			"lastIds": "62d7f4ed-4063-4c44-af8b-39050bd44926",
			"events": {
				"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
					"name": "StartEvent1"
				},
				"2798f4e7-bc42-4fad-a248-159095a2f40a": {
					"name": "EndEvent1"
				}
			},
			"activities": {
				"b5d3570c-6b9d-4144-97ea-812507df1c4a": {
					"name": "ReferencedSubflow1"
				}
			},
			"sequenceFlows": {
				"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
					"name": "SequenceFlow1"
				},
				"e0e4b5e5-cc93-41af-99cc-603a401850b6": {
					"name": "SequenceFlow2"
				}
			},
			"diagrams": {
				"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {}
			}
		},
		"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "StartEvent1",
			"sampleContextRefs": {
				"a05bec62-714f-45ac-a474-87ea21f6ecb3": {}
			}
		},
		"2798f4e7-bc42-4fad-a248-159095a2f40a": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "EndEvent1"
		},
		"b5d3570c-6b9d-4144-97ea-812507df1c4a": {
			"classDefinition": "com.sap.bpm.wfs.ReferencedSubflow",
			"definitionId": "ats.shop.shoppingcart",
			"multiInstanceLoopCharacteristics": {
				"type": "parallel",
				"collection": "${context.allProducts}",
				"completionCondition": "${context.allProducts[loop.counter].bola == \"reject\"}"
			},
			"inParameters": [{
				"sourceExpression": "${context.allProducts[loop.counter].id}",
				"targetVariable": "${context.id}"
			}],
			"outParameters": [{
				"sourceExpression": "${context.response}",
				"targetVariable": "${context.allProducts[loop.counter].response}"
			}, {
				"sourceExpression": "${context.approved}",
				"targetVariable": "${context.allProducts[loop.counter].bola}"
			}],
			"id": "referencedsubflow1",
			"name": "ReferencedSubflow1",
			"principalPropagationRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "b5d3570c-6b9d-4144-97ea-812507df1c4a"
		},
		"e0e4b5e5-cc93-41af-99cc-603a401850b6": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "b5d3570c-6b9d-4144-97ea-812507df1c4a",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"df898b52-91e1-4778-baad-2ad9a261d30e": {},
				"53e54950-7757-4161-82c9-afa7e86cff2c": {},
				"6bb141da-d485-4317-93b8-e17711df4c32": {},
				"3a06502e-86bb-4c70-b5e7-2fe1a95f676f": {},
				"39066c1b-fb6a-4515-b206-d3ee39a9d22b": {}
			}
		},
		"a05bec62-714f-45ac-a474-87ea21f6ecb3": {
			"classDefinition": "com.sap.bpm.wfs.SampleContext",
			"reference": "/sample-data/MainWorkflow/main.json",
			"id": "default-start-context"
		},
		"df898b52-91e1-4778-baad-2ad9a261d30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 100,
			"y": 100,
			"width": 32,
			"height": 32,
			"object": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"53e54950-7757-4161-82c9-afa7e86cff2c": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 340,
			"y": 100,
			"width": 35,
			"height": 35,
			"object": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"6bb141da-d485-4317-93b8-e17711df4c32": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "116,116.375 236.24147286593848,116.375",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "3a06502e-86bb-4c70-b5e7-2fe1a95f676f",
			"object": "c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f"
		},
		"3a06502e-86bb-4c70-b5e7-2fe1a95f676f": {
			"classDefinition": "com.sap.bpm.wfs.ui.ReferencedSubflowSymbol",
			"x": 186.24147286593848,
			"y": 86.75,
			"width": 100,
			"height": 60,
			"object": "b5d3570c-6b9d-4144-97ea-812507df1c4a"
		},
		"39066c1b-fb6a-4515-b206-d3ee39a9d22b": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "236.24147286593848,117.125 357.5,117.125",
			"sourceSymbol": "3a06502e-86bb-4c70-b5e7-2fe1a95f676f",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "e0e4b5e5-cc93-41af-99cc-603a401850b6"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"sequenceflow": 2,
			"startevent": 1,
			"endevent": 1,
			"referencedsubflow": 1
		}
	}
}