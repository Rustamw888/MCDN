package MCDN;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class CreateJson {

    public JSONObject deleteProject(String id) {

        String json = String.format("{\n" +
                "  \"operationName\": \"RemoveProject\",\n" +
                "  \"variables\": {\n" +
                "    \"input\": {\n" +
                "      \"id\": \"%s\"\n" +
                "    }\n" +
                "  },\n" +
                "  \"query\": \"mutation RemoveProject($input: RemoveProjectInput!) {\\n  removeProject(input: $input) {\\n    ...RemoveProjectPayload\\n    __typename\\n  }\\n}\\n\\nfragment RemoveProjectPayload on RemoveProjectPayload {\\n  project {\\n    ...Project\\n    __typename\\n  }\\n  __typename\\n}\\n\\nfragment Project on Project {\\n  id\\n  name\\n  description\\n  companyId\\n  creator {\\n    role\\n    firstName\\n    lastName\\n    isActive\\n    avatarUrl\\n    __typename\\n  }\\n  __typename\\n}\\n\"\n" +
                "}", id);
        JSONParser parser = new JSONParser();
        JSONObject jsonObject = null;
        try {
            jsonObject = (JSONObject) parser.parse(json);
        } catch (ParseException e) {

        }
        return jsonObject;
    }

    public JSONObject createAgent(String id) {

        String json = String.format("{\"operationName\":\"CreateAgent\",\"variables\":{\"input\":{\"projectId\":\"%s\",\"name\":\"21345\",\"description\":\"\"}},\"query\":\"mutation CreateAgent($input: CreateAgentInput!) {\\n  createAgent(input: $input) {\\n    ...CreateAgentPayload\\n    __typename\\n  }\\n}\\n\\nfragment CreateAgentPayload on CreateAgentPayload {\\n  agent {\\n    ...Agent\\n    project {\\n      ...Project\\n      agentList {\\n        ...Agent\\n        channelList {\\n          ...Channel\\n          __typename\\n        }\\n        __typename\\n      }\\n      __typename\\n    }\\n    __typename\\n  }\\n  __typename\\n}\\n\\nfragment Agent on Agent {\\n  id\\n  name\\n  description\\n  projectId\\n  __typename\\n}\\n\\nfragment Project on Project {\\n  id\\n  name\\n  description\\n  companyId\\n  creator {\\n    role\\n    firstName\\n    lastName\\n    isActive\\n    avatarUrl\\n    __typename\\n  }\\n  __typename\\n}\\n\\nfragment Channel on Channel {\\n  id\\n  token\\n  status\\n  agentId\\n  test\\n  connectorId\\n  connector {\\n    ...Connector\\n    __typename\\n  }\\n  __typename\\n}\\n\\nfragment Connector on Connector {\\n  id\\n  serviceName\\n  __typename\\n}\\n\"}", id);
        JSONParser parser = new JSONParser();
        JSONObject jsonObject = null;
        try {
            jsonObject = (JSONObject) parser.parse(json);
        } catch (ParseException e) {

        }
        return jsonObject;
    }

    public JSONObject createAgent(String id, String name) {

        String json = String.format("{\"operationName\":\"CreateAgent\",\"variables\":{\"input\":{\"projectId\":\"%s\",\"name\":\"%s\",\"description\":\"\"}},\"query\":\"mutation CreateAgent($input: CreateAgentInput!) {\\n  createAgent(input: $input) {\\n    ...CreateAgentPayload\\n    __typename\\n  }\\n}\\n\\nfragment CreateAgentPayload on CreateAgentPayload {\\n  agent {\\n    ...Agent\\n    project {\\n      ...Project\\n      agentList {\\n        ...Agent\\n        channelList {\\n          ...Channel\\n          __typename\\n        }\\n        __typename\\n      }\\n      __typename\\n    }\\n    __typename\\n  }\\n  __typename\\n}\\n\\nfragment Agent on Agent {\\n  id\\n  name\\n  description\\n  projectId\\n  __typename\\n}\\n\\nfragment Project on Project {\\n  id\\n  name\\n  description\\n  companyId\\n  creator {\\n    role\\n    firstName\\n    lastName\\n    isActive\\n    avatarUrl\\n    __typename\\n  }\\n  __typename\\n}\\n\\nfragment Channel on Channel {\\n  id\\n  token\\n  status\\n  agentId\\n  test\\n  connectorId\\n  connector {\\n    ...Connector\\n    __typename\\n  }\\n  __typename\\n}\\n\\nfragment Connector on Connector {\\n  id\\n  serviceName\\n  __typename\\n}\\n\"}", id, name);
        JSONParser parser = new JSONParser();
        JSONObject jsonObject = null;
        try {
            jsonObject = (JSONObject) parser.parse(json);
        } catch (ParseException e) {

        }
        return jsonObject;
    }

    public JSONObject importAgent(String id) {
        System.out.println("IMPORT AGENT " + id);
        String json = String.format("{\"operationName\":\"ImportAgentConfig\",\"variables\":{\"input\":{\"agentId\":\"%s\",\"file\":null}},\"query\":\"mutation ImportAgentConfig($input: ImportAgentConfigInput!) {\\n  importAgentConfig(input: $input) {\\n    ...ImportAgentConfigPayload\\n    __typename\\n  }\\n}\\n\\nfragment ImportAgentConfigPayload on ImportAgentConfigPayload {\\n  agentId\\n  agent {\\n    ...Agent\\n    project {\\n      ...Project\\n      agentList {\\n        ...Agent\\n        channelList {\\n          ...Channel\\n          __typename\\n        }\\n        __typename\\n      }\\n      __typename\\n    }\\n    __typename\\n  }\\n  __typename\\n}\\n\\nfragment Agent on Agent {\\n  id\\n  name\\n  description\\n  projectId\\n  __typename\\n}\\n\\nfragment Project on Project {\\n  id\\n  name\\n  description\\n  companyId\\n  creator {\\n    role\\n    firstName\\n    lastName\\n    isActive\\n    avatarUrl\\n    __typename\\n  }\\n  __typename\\n}\\n\\nfragment Channel on Channel {\\n  id\\n  token\\n  status\\n  agentId\\n  test\\n  connectorId\\n  connector {\\n    ...Connector\\n    __typename\\n  }\\n  __typename\\n}\\n\\nfragment Connector on Connector {\\n  id\\n  serviceName\\n  __typename\\n}\\n\"}", id);
        JSONParser parser = new JSONParser();
        JSONObject jsonObject = null;
        try {
            jsonObject = (JSONObject) parser.parse(json);
        } catch (ParseException e) {

        }
        return jsonObject;
    }

}
