class Student {
  constructor (first, last) {
    this.first = first;
    this.last = last;
    this.courses = [];
  }
}

Student.prototype.name = function () {
  console.log(`${this.first} ${this.last}`);
};

Student.prototype.enroll = function (course) {
  if (!this.courses.includes(course)) {
    this.courses.push(course);
    course.students.push(this);
  } else {
    console.log("Already enrolled");
  }
};

Student.prototype.courseLoad = function () {
  let hash = {};

  this.courses.forEach(function(course) {
    if (hash[course.department] === undefined) {
      hash[course.department] = 0;
    }
    hash[course.department] += course.credits;
  });

  return hash;
};


class Course {
  constructor (name, department, credits) {
    this.name = name;
    this.department = department;
    this.credits = credits;
    this.students = [];
  }
}

Course.prototype.addStudent = function (student) {
  student.enroll(this);
};


let s1 = new Student("AJ", "Ansel");
let s2 = new Student("Ryan", "Mapa");
let c1 = new Course("AA", "CS", 100);
let c2 = new Course("AA2", "CS", 300);
let c3 = new Course("AA3", "Math", 50);

s1.enroll(c1);
s1.enroll(c2);
s1.enroll(c3);

// Bonus: Overlapping courses 
