{
	"contents": {
		"1c16c436-e0ba-4f32-a9ab-6303593c0685": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "ats.shop.shoppingcart",
			"subject": "Shoppingcarts",
			"name": "Shoppingcart",
			"documentation": "Shopping Cart approval workflow ss",
			"lastIds": "62d7f4ed-4063-4c44-af8b-39050bd44926",
			"events": {
				"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
					"name": "StartEvent1"
				},
				"2798f4e7-bc42-4fad-a248-159095a2f40a": {
					"name": "EndEvent1"
				},
				"96c3dacd-753d-42da-b33e-d2507e31f32a": {
					"name": "EndEvent2"
				}
			},
			"activities": {
				"7835698a-5b29-4c81-bf5a-1b54ec905a4c": {
					"name": "FetchProductDetails"
				},
				"495626f7-a9ea-4fc0-bba0-9f8b039a4642": {
					"name": "CheckPrices"
				},
				"7a05adf5-d5af-4945-b705-84916d1d4178": {
					"name": "ExclusiveGateway1"
				},
				"75c27432-c41d-427b-b4ac-8b2c3d98af1a": {
					"name": "RequestApproval"
				},
				"691814ea-1e1e-4a14-90f9-de3fff2fa834": {
					"name": "CheckApproval"
				},
				"df11113b-200e-4157-b26b-0715abbda449": {
					"name": "CheckForApproval"
				}
			},
			"sequenceFlows": {
				"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
					"name": "SequenceFlow1"
				},
				"cf2a753d-9ae0-4cce-9156-2e5c17ac2275": {
					"name": "SequenceFlow2"
				},
				"9d924990-d9f3-41a0-a580-b494332897fe": {
					"name": "SequenceFlow3"
				},
				"4b357e05-33db-4dbf-88c4-55455448be59": {
					"name": "CheckIfQualifyAutoApproval"
				},
				"42bff8cf-6abf-4442-b4a9-a4d32b35df6b": {
					"name": "RequestForApproval(default)"
				},
				"c8ea4838-14e9-4936-82d6-7b524d592a51": {
					"name": "SequenceFlow7"
				},
				"4ce40623-e882-4a3d-b528-66c773c33ee2": {
					"name": "SequenceFlow8"
				},
				"18bb49d2-a930-4510-9ccf-e16dc9c07973": {
					"name": "SequenceFlow9"
				},
				"6a050999-aef6-4624-99b5-75f634004c8d": {
					"name": "RejectRequest(default)"
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
				"4aa8b813-96f6-4bd8-86e4-c08cbb5b44c7": {}
			}
		},
		"2798f4e7-bc42-4fad-a248-159095a2f40a": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "EndEvent1"
		},
		"96c3dacd-753d-42da-b33e-d2507e31f32a": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent2",
			"name": "EndEvent2"
		},
		"7835698a-5b29-4c81-bf5a-1b54ec905a4c": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "CFN",
			"destinationSource": "consumer",
			"path": "/sap/opu/odata/sap/EPM_REF_APPS_SHOP_SRV/Products('${context.id}')?$format=json",
			"httpMethod": "GET",
			"responseVariable": "${context.response}",
			"id": "servicetask1",
			"name": "FetchProductDetails"
		},
		"495626f7-a9ea-4fc0-bba0-9f8b039a4642": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/Shoppingcart/CheckAutoApproval.js",
			"id": "scripttask1",
			"name": "CheckPrices",
			"documentation": "Check price and set flag"
		},
		"7a05adf5-d5af-4945-b705-84916d1d4178": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway1",
			"name": "ExclusiveGateway1",
			"default": "42bff8cf-6abf-4442-b4a9-a4d32b35df6b"
		},
		"75c27432-c41d-427b-b4ac-8b2c3d98af1a": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Please Over approve Request for product ${context.response.d.Name}",
			"description": "Please approve Request for product ${context.response.d.Name}",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": true,
			"userInterface": "sapui5://custom-.atsshopworkflowuimodule/ats.shop.workflowuimodule",
			"recipientUsers": "${info.startedBy}",
			"userInterfaceParams": [],
			"id": "usertask1",
			"name": "RequestApproval",
			"documentation": "Request Shopping Cart Approval\n"
		},
		"691814ea-1e1e-4a14-90f9-de3fff2fa834": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/Shoppingcart/CheckApprovalByManager.js",
			"id": "scripttask2",
			"name": "CheckApproval"
		},
		"df11113b-200e-4157-b26b-0715abbda449": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway2",
			"name": "CheckForApproval",
			"documentation": "Check the approval status of shopping cart",
			"default": "6a050999-aef6-4624-99b5-75f634004c8d"
		},
		"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "7835698a-5b29-4c81-bf5a-1b54ec905a4c"
		},
		"cf2a753d-9ae0-4cce-9156-2e5c17ac2275": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "7835698a-5b29-4c81-bf5a-1b54ec905a4c",
			"targetRef": "495626f7-a9ea-4fc0-bba0-9f8b039a4642"
		},
		"9d924990-d9f3-41a0-a580-b494332897fe": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow3",
			"name": "SequenceFlow3",
			"sourceRef": "495626f7-a9ea-4fc0-bba0-9f8b039a4642",
			"targetRef": "7a05adf5-d5af-4945-b705-84916d1d4178"
		},
		"4b357e05-33db-4dbf-88c4-55455448be59": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.autoApprove == true}",
			"id": "sequenceflow4",
			"name": "CheckIfQualifyAutoApproval",
			"sourceRef": "7a05adf5-d5af-4945-b705-84916d1d4178",
			"targetRef": "96c3dacd-753d-42da-b33e-d2507e31f32a"
		},
		"42bff8cf-6abf-4442-b4a9-a4d32b35df6b": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow6",
			"name": "RequestForApproval(default)",
			"sourceRef": "7a05adf5-d5af-4945-b705-84916d1d4178",
			"targetRef": "75c27432-c41d-427b-b4ac-8b2c3d98af1a"
		},
		"c8ea4838-14e9-4936-82d6-7b524d592a51": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow7",
			"name": "SequenceFlow7",
			"sourceRef": "75c27432-c41d-427b-b4ac-8b2c3d98af1a",
			"targetRef": "691814ea-1e1e-4a14-90f9-de3fff2fa834"
		},
		"4ce40623-e882-4a3d-b528-66c773c33ee2": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow8",
			"name": "SequenceFlow8",
			"sourceRef": "691814ea-1e1e-4a14-90f9-de3fff2fa834",
			"targetRef": "df11113b-200e-4157-b26b-0715abbda449"
		},
		"18bb49d2-a930-4510-9ccf-e16dc9c07973": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.decision == \"approve\"}",
			"id": "sequenceflow9",
			"name": "SequenceFlow9",
			"sourceRef": "df11113b-200e-4157-b26b-0715abbda449",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"6a050999-aef6-4624-99b5-75f634004c8d": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow11",
			"name": "RejectRequest(default)",
			"sourceRef": "df11113b-200e-4157-b26b-0715abbda449",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"df898b52-91e1-4778-baad-2ad9a261d30e": {},
				"53e54950-7757-4161-82c9-afa7e86cff2c": {},
				"6bb141da-d485-4317-93b8-e17711df4c32": {},
				"8fc04044-1510-4984-a637-0d9c4fee7a3d": {},
				"fbf1a79c-ac7a-41da-9e31-a9551fdefd13": {},
				"0da64f8e-43a9-4bee-a4d2-b3e4afb6c1a6": {},
				"048d60f1-13e0-4953-96bd-339a6d571ea2": {},
				"3a9cd8e3-3a71-4867-b41f-6885c009f8e4": {},
				"15c16aed-bb0c-4952-94f3-c5623476bdd6": {},
				"0e8be1e9-5bb7-46a0-8980-6d077cd24596": {},
				"ba086d15-9662-44ed-9fa2-5e161346f119": {},
				"038c524f-d22d-46e9-89ea-af599e528412": {},
				"2d78f86c-3636-495b-a1b1-21ee41e306e5": {},
				"cfb90080-353d-4325-9e4d-140dc98ae007": {},
				"bb39e3ff-bcd8-42dd-bf1a-fd79183af273": {},
				"5fdee437-74f4-4431-b745-145e657461af": {},
				"44dca2d1-379c-43d1-86d7-adc520713cec": {},
				"a4bcc767-2236-41c3-826c-500d6b1b6f65": {}
			}
		},
		"4aa8b813-96f6-4bd8-86e4-c08cbb5b44c7": {
			"classDefinition": "com.sap.bpm.wfs.SampleContext",
			"reference": "/sample-data/Shoppingcart/ProductDetails.json",
			"id": "default-start-context"
		},
		"df898b52-91e1-4778-baad-2ad9a261d30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 121,
			"y": 12,
			"width": 32,
			"height": 32,
			"object": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"53e54950-7757-4161-82c9-afa7e86cff2c": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 119.5,
			"y": 907.9999952316284,
			"width": 35,
			"height": 35,
			"object": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"6bb141da-d485-4317-93b8-e17711df4c32": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "137,44 137,94",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "8fc04044-1510-4984-a637-0d9c4fee7a3d",
			"object": "c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f"
		},
		"8fc04044-1510-4984-a637-0d9c4fee7a3d": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 87,
			"y": 94,
			"width": 100,
			"height": 60,
			"object": "7835698a-5b29-4c81-bf5a-1b54ec905a4c"
		},
		"fbf1a79c-ac7a-41da-9e31-a9551fdefd13": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "137,154 137,204",
			"sourceSymbol": "8fc04044-1510-4984-a637-0d9c4fee7a3d",
			"targetSymbol": "0da64f8e-43a9-4bee-a4d2-b3e4afb6c1a6",
			"object": "cf2a753d-9ae0-4cce-9156-2e5c17ac2275"
		},
		"0da64f8e-43a9-4bee-a4d2-b3e4afb6c1a6": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 87,
			"y": 204,
			"width": 100,
			"height": 60,
			"object": "495626f7-a9ea-4fc0-bba0-9f8b039a4642"
		},
		"048d60f1-13e0-4953-96bd-339a6d571ea2": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "137,264 137,314",
			"sourceSymbol": "0da64f8e-43a9-4bee-a4d2-b3e4afb6c1a6",
			"targetSymbol": "3a9cd8e3-3a71-4867-b41f-6885c009f8e4",
			"object": "9d924990-d9f3-41a0-a580-b494332897fe"
		},
		"3a9cd8e3-3a71-4867-b41f-6885c009f8e4": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 116,
			"y": 314,
			"object": "7a05adf5-d5af-4945-b705-84916d1d4178"
		},
		"15c16aed-bb0c-4952-94f3-c5623476bdd6": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "137,356 137,390.99999940395355 62,390.99999940395355 62,425.9999988079071",
			"sourceSymbol": "3a9cd8e3-3a71-4867-b41f-6885c009f8e4",
			"targetSymbol": "a4bcc767-2236-41c3-826c-500d6b1b6f65",
			"object": "4b357e05-33db-4dbf-88c4-55455448be59"
		},
		"0e8be1e9-5bb7-46a0-8980-6d077cd24596": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 129.5,
			"y": 425.9999988079071,
			"width": 100,
			"height": 60,
			"object": "75c27432-c41d-427b-b4ac-8b2c3d98af1a"
		},
		"ba086d15-9662-44ed-9fa2-5e161346f119": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "137,356 137,390.99999940395355 179.5,390.99999940395355 179.5,425.9999988079071",
			"sourceSymbol": "3a9cd8e3-3a71-4867-b41f-6885c009f8e4",
			"targetSymbol": "0e8be1e9-5bb7-46a0-8980-6d077cd24596",
			"object": "42bff8cf-6abf-4442-b4a9-a4d32b35df6b"
		},
		"038c524f-d22d-46e9-89ea-af599e528412": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "179.5,485.9999988079071 179.5,520.9999982118607 137,520.9999982118607 137,555.9999976158142",
			"sourceSymbol": "0e8be1e9-5bb7-46a0-8980-6d077cd24596",
			"targetSymbol": "2d78f86c-3636-495b-a1b1-21ee41e306e5",
			"object": "c8ea4838-14e9-4936-82d6-7b524d592a51"
		},
		"2d78f86c-3636-495b-a1b1-21ee41e306e5": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 87,
			"y": 555.9999976158142,
			"width": 100,
			"height": 60,
			"object": "691814ea-1e1e-4a14-90f9-de3fff2fa834"
		},
		"cfb90080-353d-4325-9e4d-140dc98ae007": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "137,615.9999976158142 137,665.9999976158142",
			"sourceSymbol": "2d78f86c-3636-495b-a1b1-21ee41e306e5",
			"targetSymbol": "bb39e3ff-bcd8-42dd-bf1a-fd79183af273",
			"object": "4ce40623-e882-4a3d-b528-66c773c33ee2"
		},
		"bb39e3ff-bcd8-42dd-bf1a-fd79183af273": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 116,
			"y": 665.9999976158142,
			"object": "df11113b-200e-4157-b26b-0715abbda449"
		},
		"5fdee437-74f4-4431-b745-145e657461af": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "135.5,707.9999976158142 135.5,935.9999964237213",
			"sourceSymbol": "bb39e3ff-bcd8-42dd-bf1a-fd79183af273",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "18bb49d2-a930-4510-9ccf-e16dc9c07973"
		},
		"44dca2d1-379c-43d1-86d7-adc520713cec": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "137.5,707.9999976158142 137.5,924.9999964237213",
			"sourceSymbol": "bb39e3ff-bcd8-42dd-bf1a-fd79183af273",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "6a050999-aef6-4624-99b5-75f634004c8d"
		},
		"a4bcc767-2236-41c3-826c-500d6b1b6f65": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 44.5,
			"y": 425.9999988079071,
			"width": 35,
			"height": 35,
			"object": "96c3dacd-753d-42da-b33e-d2507e31f32a"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"timereventdefinition": 1,
			"maildefinition": 4,
			"sequenceflow": 14,
			"startevent": 1,
			"boundarytimerevent": 1,
			"endevent": 2,
			"usertask": 1,
			"servicetask": 1,
			"scripttask": 2,
			"mailtask": 4,
			"exclusivegateway": 2
		}
	}
}