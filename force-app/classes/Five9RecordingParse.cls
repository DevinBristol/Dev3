/**
 * Created by Devin on 4/4/2024.
 */

        public class Five9RecordingParse {

            public String id { get; set; }
            public List<Records> records { get; set; }
            public Integer recordsTotal { get; set; }
            public Boolean hasMore { get; set; }
            public Integer currentPage { get; set; }

            public Five9RecordingParse(JSONParser parser) {
                while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                    if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                        String text = parser.getText();
                        if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                            if (text == 'id') {
                                id = parser.getText();
                            } else if (text == 'records') {
                                records = arrayOfRecords(parser);
                            } else if (text == 'recordsTotal') {
                                recordsTotal = parser.getIntegerValue();
                            } else if (text == 'hasMore') {
                                hasMore = parser.getBooleanValue();
                            } else if (text == 'currentPage') {
                                currentPage = parser.getIntegerValue();
                            } else {
                                System.debug(LoggingLevel.WARN, 'JSON2Apex consuming unrecognized property: ' + text);
                                consumeObject(parser);
                            }
                        }
                    }
                }
            }

            public class Records {
                public String id { get; set; }
                public String campaignId { get; set; }
                public Long created { get; set; }
                public String number_Z { get; set; } // in json: number
                public String name { get; set; }
                public Integer length { get; set; }
                public String status { get; set; }
                public String callSessionId { get; set; }

                public Records(JSONParser parser) {
                    while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                        if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                            String text = parser.getText();
                            if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                                if (text == 'id') {
                                    id = parser.getText();
                                } else if (text == 'campaignId') {
                                    campaignId = parser.getText();
                                } else if (text == 'created') {
                                    created = parser.getLongValue();
                                } else if (text == 'number') {
                                    number_Z = parser.getText();
                                } else if (text == 'name') {
                                    name = parser.getText();
                                } else if (text == 'length') {
                                    length = parser.getIntegerValue();
                                } else if (text == 'status') {
                                    status = parser.getText();
                                } else if (text == 'callSessionId') {
                                    callSessionId = parser.getText();
                                } else {
                                    System.debug(LoggingLevel.WARN, 'Records consuming unrecognized property: ' + text);
                                    consumeObject(parser);
                                }
                            }
                        }
                    }
                }
            }


            public static Five9RecordingParse parse(String json) {
                System.JSONParser parser = System.JSON.createParser(json);
                return new Five9RecordingParse(parser);
            }

            public static void consumeObject(System.JSONParser parser) {
                Integer depth = 0;
                do {
                    System.JSONToken curr = parser.getCurrentToken();
                    if (curr == System.JSONToken.START_OBJECT ||
                            curr == System.JSONToken.START_ARRAY) {
                        depth++;
                    } else if (curr == System.JSONToken.END_OBJECT ||
                            curr == System.JSONToken.END_ARRAY) {
                        depth--;
                    }
                } while (depth > 0 && parser.nextToken() != null);
            }


            private static List<Records> arrayOfRecords(System.JSONParser p) {
                List<Records> res = new List<Records>();
                if (p.getCurrentToken() == null) p.nextToken();
                while (p.nextToken() != System.JSONToken.END_ARRAY) {
                    res.add(new Records(p));
                }
                return res;
            }
        }







