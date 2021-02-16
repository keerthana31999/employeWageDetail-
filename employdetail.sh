#!/bin/bash -x
#constant
EMP_RATE_PER_HR=20
DAYS_IN_MONTH=20
MAX_HRS_IN_MONTH=100



isPresentfulltime=1
isPresentPartTime=2
days=0
hours=0
function getWorkHr() {
		local empCheck=$1

		if [ $empCheck -eq $isPresentFullTime ]
		then
				empHr=8
		elif [ $empCheck -eq $isPresentPartTime ]
		then
				empHr=4
		else
				empHr=0
		fi
		echo $empHr
}

function calDailyWage() {
		local empHr=$1
		wage=$(($empHr*$EMP_RATE_PER_HR))
		echo $wage
}

while [[ $days -ne $DAYS_IN_MONTH && $hours -le $MAX_HRS_IN_MONTH ]]
do
		((days++))
		empCheck=$((RANDOM%3))
		empHr="$( getWorkHr $empCheck)"
		hours=$(($hours+$empHr))
		dailyWage[$days]=$( calDailyWage $empHr )
done

empMonthWage=$(($hours*$EMP_RATE_PER_HR))
echo "Total Wage :"$empMonthWage
echo "Daily Wage : "${dailyWage[@]}
echo "Day : "${!dailyWage[@]}
