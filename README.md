# Button Task
<img src = "https://github.com/Sahilk0809/timer_daily_task/assets/149374235/7cd8e54a-a659-424e-9643-02ed86560bea" height=65% width=22%>

<a href="https://github.com/Sahilk0809/timer_daily_task/blob/master/lib/button.dart">Click here for the source code</a>

# Asyncronous Programming


# 1. What is Asynchronous programming?

Asynchronous programming is a programming paradigm that allows tasks or operations to run independently and concurrently, without waiting for each other to complete before moving on to the next task.


# 2. What is Future Class ?

Future represents a value that may not be available yet. It encapsulates an asynchronous operation and provides a way to handle the result or error when it becomes available. 


# 3. What is Duration class & Future.delayed() constructor with Example ?

`Duration :`
A span of time, such as 27 days, 4 hours, 12 minutes, and 3 seconds. A Duration represents a difference from one point in time to another.

`Future.delayed() :`
Delay function creates a future that runs its computation after a delay.

# Example

```bash
  void main(){

  print("Hello Android!");

  Future.delayed(Duration(seconds: 3), () {
    print("Hello Dart!"); // this line will execute after the duration completes
  },);

  print("Hello Flutter!");
}
```

# 4. What is the Use of the async & await keyword?

`async :` The async keyword is used to mark a function as asynchronous.

`await :` The await keyword is used to pause the execution of an asynchronous function until a particular asynchronous operation is completed. 

# 5. What is Recursion ? With Example. 

 The function calls itself repeatedly until a base condition is reached.

 # Example

 ```bash
 void main() {  
   int factorial(int num){  
     
  if(num<=1) { // base case  
        return 1;  
  else{  
         return n*fact(n-1);  
      }  
    }      
   }  
}  
```

# 6. What is Timer class with example?

A countdown timer that can be configured to fire once or repeatedly.

# Example

 ```bash
 import 'dart:async';

void main(){

  print("Hello Android!");

  Timer(Duration(seconds: 3), () { 
    print("Hello Dart!");
  });

  print("Hello Flutter!");
}
```

# 7. What is Timer.periodic and use with Example?

It allows you to schedule a callback to be executed repeatedly with a specified duration between each call.

# Example

```bash
var counter = 3;
Timer.periodic(const Duration(seconds: 2), (timer) {
  print(timer.tick);
  counter--;
  if (counter == 0) {
    print('Cancel timer');
    timer.cancel();
  }
});
```


# Digital Clock App
<img src="https://github.com/Sahilk0809/timer_daily_task/assets/149374235/49324529-c9f6-42e2-87e3-719ccdecb194" height=65% width=22%>

# Analog Clock
<img src="https://github.com/Sahilk0809/timer_daily_task/assets/149374235/87c59645-ee5a-4e30-ba0c-aa2a0157a535" height=65% width=22%>

https://github.com/Sahilk0809/timer_daily_task/assets/149374235/7d06b5b1-e3f2-495e-a640-a95577c73d39

<a href="https://github.com/Sahilk0809/timer_daily_task/blob/master/lib/digital_clock/digital_clock_app.dart"> Click here for the source code </a>

# Timer App

https://github.com/Sahilk0809/timer_daily_task/assets/149374235/319dfde2-6c65-4395-af46-2ecf89b99c44

<a href="https://github.com/Sahilk0809/timer_daily_task/tree/master/lib"> Click here for the source code </a>



