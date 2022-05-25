// CMSC 341 - Fall 2020 - Project 3
// mytest.cpp: sample driver for the PQueue class.

#include "pqueue.h"
using namespace std;
// Priority functions compute an integer priority for a patient.  Internal
// computations may be floating point, but must return an integer.

int priorityFn1(const Patient &patient);
int priorityFn2(const Patient &patient);
int priorityFn3(const Patient &patient);

int main() {

    // Create a patient queue with capacity five and priority function
    // priorityFn1()

    PQueue queue1(priorityFn1);
    PQueue queue2(priorityFn1);
    PQueue queue3(priorityFn1);

    // Create some test jobs and insert them into the queue
    //Patient(string name, int triage, int temp, int ox, int rr, int hr, int bp)
    Patient patient1("Sam", 1, 37, 79,  36, 133, 75);
    Patient patient2("Liz", 5, 37, 98, 26,  70, 100);
    Patient patient3("Nick", 2, 37, 85, 34, 125, 85);
    Patient patient4("Eva", 3, 37, 95,  22, 115, 92);
    Patient patient5("John", 5, 37, 97,  32, 115, 87);
    Patient patient6("Adam", 2, 37, 96,  34, 115, 76);
    Patient patient7("Carey", 1, 37, 95,  37, 115, 90);
    Patient patient8("Mark", 1, 37, 95,  25, 115, 80);
    Patient patient9("Zach", 2, 38, 85,  27, 115, 75);
    Patient patient10("James", 4, 37, 77,  23, 115, 95);
    Patient patient11("Olivia", 5, 37, 88,  25, 115, 77);
    Patient patient12("Claire", 4, 37, 98,  31, 115, 91);
    Patient patient13("Nick", 3, 38, 94,  30, 115, 96);


    queue1.insertPatient(patient3);
    queue1.insertPatient(patient1);
    queue1.insertPatient(patient2);
    queue1.insertPatient(patient4);
    queue1.insertPatient(patient5);
    queue1.insertPatient(patient6);
    queue1.insertPatient(patient7);
    queue1.insertPatient(patient8);
    queue1.insertPatient(patient9);
    queue1.insertPatient(patient10);
    queue1.insertPatient(patient11);
    queue1.insertPatient(patient12);
    queue1.insertPatient(patient13);


    std::cout << "\nqueue1 dump after inserting 13 patients:" << std::endl;
    queue1.dump();


    queue2.insertPatient(patient5);
    queue2.insertPatient(patient6);

    std::cout << "\nqueue2 dump after inserting 2 patients (John, Mia):" << std::endl;
    queue2.dump();

    queue1.mergeWithQueue(queue2);

    // Print the queue, change priority function, print again, change
    // again, print again.  Changing the priority function should cause
    // the heap to be rebuilt.

    std::cout << std::endl << "Contents of queue1 after merging with queue2:\n";
    queue1.printPatientQueue();
    std::cout << "\nDump queue1 after merging with queue2:\n";
    queue1.dump();

    std::cout << "\nTesting getsize(): \n";
    cout << queue1.numPatients() << endl; //prints 13

    std::cout << "\nTesting getNextPatient(): \n";
    queue1.getNextPatient();
    queue1.getNextPatient();
    queue1.getNextPatient();
    queue1.getNextPatient();
    queue1.getNextPatient();
    queue1.dump();


  queue1.setPriorityFn(priorityFn2);

  std::cout << std::endl << "Contents of queue1 after changing the priority function to priorityFn2:\n";
  queue1.printPatientQueue();
  std::cout << "\nDump queue1 after changing the priority function to priorityFn2:\n";
  queue1.dump();

  queue1.setPriorityFn(priorityFn1);

  std::cout << std::endl << "Contents of queue1 after changing the priority function back to priorityFn1:\n";
  queue1.printPatientQueue();
  std::cout << "\nDump queue1 after changing the priority function back to priorityFn1:\n";
  queue1.dump();

  std::cout << "\nTesting clear(): \n";
  queue1.clear();
  queue1.dump(); //should be empty, prints nothing


  return 0;
}

int priorityFn1(const Patient&patient) {
    int pri = 5;
    if ((patient.getOxygen()<80 && (patient.getRR() > 35 || patient.getRR() < 8)) ||
        (patient.getHR() > 130 && patient.getBP() < 80))
        pri = 1;
    else if (((patient.getOxygen() >= 80 && patient.getOxygen() <= 89) &&
              (patient.getRR() >= 31 && patient.getRR() <= 35)) ||
             (patient.getTemperature() >= 40 || patient.getTemperature() <= 32))
        pri = 2;
    else if ((patient.getOxygen() >= 90 && patient.getOxygen() <= 94) &&
             (patient.getRR() >= 26 && patient.getRR() <= 30))
        pri = 3;
    else if ((patient.getOxygen() >= 95 && patient.getOxygen() <= 97) &&
             (patient.getRR() >= 21 && patient.getRR() <= 25))
        pri = 4;
    else
        pri = 5;
    return pri;
}

int priorityFn2(const Patient&patient) {
    //priority only based on triage
    //traige is set by a health care professional
    return patient.getTriage();
}
int priorityFn3(const Patient&patient) {
    //priority only based on triage
    //traige is set by a health care professional
    return patient.getOxygen();
}