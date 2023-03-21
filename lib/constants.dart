import 'package:flutter/material.dart';

final heroCard = BoxDecoration(
    image: const DecorationImage(
        image: AssetImage(
          'assets/chatgpt3.jpg',
        ),
        fit: BoxFit.cover,
        opacity: 0.2),
    color: Colors.white,
    borderRadius: BorderRadius.circular(16.0),
    boxShadow: [
      BoxShadow(
          color: Colors.grey.withOpacity(.12),
          offset: const Offset(0, 27),
          blurRadius: 27,
          spreadRadius: .5)
    ]);

final heroNav = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(50.0),
    boxShadow: [
      BoxShadow(
          color: Colors.black.withOpacity(.23),
          offset: const Offset(2, 18),
          blurRadius: 18,
          spreadRadius: .5)
    ]);

const token =
    "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik1UaEVOVUpHTkVNMVFURTRNMEZCTWpkQ05UZzVNRFUxUlRVd1FVSkRNRU13UmtGRVFrRXpSZyJ9.eyJodHRwczovL2FwaS5vcGVuYWkuY29tL3Byb2ZpbGUiOnsiZW1haWwiOiJzYXJhbmd0aGVtYW1hcmppdDEyM0BnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZX0sImh0dHBzOi8vYXBpLm9wZW5haS5jb20vYXV0aCI6eyJ1c2VyX2lkIjoidXNlci1yMXhDMnBGQk1OdzR6WURJdE9CSXgzMXIifSwiaXNzIjoiaHR0cHM6Ly9hdXRoMC5vcGVuYWkuY29tLyIsInN1YiI6Imdvb2dsZS1vYXV0aDJ8MTE3ODE5OTUwMzE0MzU4MjU1NjYxIiwiYXVkIjpbImh0dHBzOi8vYXBpLm9wZW5haS5jb20vdjEiLCJodHRwczovL29wZW5haS5vcGVuYWkuYXV0aDBhcHAuY29tL3VzZXJpbmZvIl0sImlhdCI6MTY3ODg2MTc2NCwiZXhwIjoxNjgwMDcxMzY0LCJhenAiOiJUZEpJY2JlMTZXb1RIdE45NW55eXdoNUU0eU9vNkl0RyIsInNjb3BlIjoib3BlbmlkIHByb2ZpbGUgZW1haWwgbW9kZWwucmVhZCBtb2RlbC5yZXF1ZXN0IG9yZ2FuaXphdGlvbi5yZWFkIG9mZmxpbmVfYWNjZXNzIn0.aXLW_g5XQznIGMROEdrL6ojChFg58-5XSPCiyJJdgqEzbltX5Nsb2gwvwKIcX8CIn9aBgucpszq5anCFQc2AtKUditjGStMNxSpTjMZmFGRVmv-GyK7RJdu4yESf8IgR8XT06yAz2gXXGClFFxLSz0oj6t17JjHlorMmb01VimkxcMXV-QflVXMS0a0qPbhp4GPAPdQq77_-poFP68X1y6bAav3aNOvD1bElRxclv-SvQ1IScx6c7Ch4i35RZPr7l_bFZuKxV8B0kuX_Gh7HwDtSzXMT21BWyqt2WTMxEJBjMN3oPMRIF-FHxWZlQDe2TX1kXEK9PWfCU6CDDk2WMw";
