; ModuleID = '../data/hip_kernels/9922/5/main.cu'
source_filename = "../data/hip_kernels/9922/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.hiprandState = type { %"class.rocrand_device::xorwow_engine" }
%"class.rocrand_device::xorwow_engine" = type { %"struct.rocrand_device::xorwow_engine::xorwow_state" }
%"struct.rocrand_device::xorwow_engine::xorwow_state" = type { i32, i32, i32, float, double, [5 x i32] }

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z6randomPdP12hiprandState(double addrspace(1)* nocapture writeonly %0, %struct.hiprandState addrspace(1)* nocapture %1) local_unnamed_addr #1 {
  %3 = alloca [12 x i8], align 4, addrspace(5)
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = getelementptr inbounds [12 x i8], [12 x i8] addrspace(5)* %3, i32 0, i32 0
  call void @llvm.lifetime.start.p5i8(i64 12, i8 addrspace(5)* %5)
  %6 = sext i32 %4 to i64
  %7 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 %6, i32 0, i32 0, i32 0
  %8 = load i32, i32 addrspace(1)* %7, align 8
  %9 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 %6, i32 0, i32 0, i32 1
  %10 = load i32, i32 addrspace(1)* %9, align 4
  %11 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 %6, i32 0, i32 0, i32 2
  %12 = load i32, i32 addrspace(1)* %11, align 8
  %13 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 %6, i32 0, i32 0, i32 3
  %14 = bitcast float addrspace(1)* %13 to i8 addrspace(1)*
  call void @llvm.memcpy.p5i8.p1i8.i64(i8 addrspace(5)* noundef align 4 dereferenceable(12) %5, i8 addrspace(1)* noundef align 4 dereferenceable(12) %14, i64 12, i1 false)
  %15 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 %6, i32 0, i32 0, i32 5, i64 0
  %16 = load i32, i32 addrspace(1)* %15, align 8
  %17 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 %6, i32 0, i32 0, i32 5, i64 1
  %18 = load i32, i32 addrspace(1)* %17, align 4
  %19 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 %6, i32 0, i32 0, i32 5, i64 2
  %20 = load i32, i32 addrspace(1)* %19, align 8
  %21 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 %6, i32 0, i32 0, i32 5, i64 3
  %22 = load i32, i32 addrspace(1)* %21, align 4
  %23 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 %6, i32 0, i32 0, i32 5, i64 4
  %24 = load i32, i32 addrspace(1)* %23, align 8
  %25 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 %6, i32 0, i32 0, i32 5, i64 5
  %26 = load i32, i32 addrspace(1)* %25, align 4
  %27 = lshr i32 %16, 2
  %28 = xor i32 %27, %16
  %29 = shl i32 %24, 4
  %30 = shl i32 %28, 1
  %31 = xor i32 %30, %29
  %32 = xor i32 %31, %28
  %33 = xor i32 %32, %24
  %34 = add i32 %8, 362437
  %35 = add i32 %33, %34
  %36 = uitofp i32 %35 to double
  %37 = getelementptr inbounds double, double addrspace(1)* %0, i64 %6
  store double %36, double addrspace(1)* %37, align 8, !tbaa !4
  store i32 %34, i32 addrspace(1)* %7, align 8
  store i32 %10, i32 addrspace(1)* %9, align 4
  store i32 %12, i32 addrspace(1)* %11, align 8
  call void @llvm.memcpy.p1i8.p5i8.i64(i8 addrspace(1)* noundef align 4 dereferenceable(12) %14, i8 addrspace(5)* noundef align 4 dereferenceable(12) %5, i64 12, i1 false)
  store i32 %18, i32 addrspace(1)* %15, align 8
  store i32 %20, i32 addrspace(1)* %17, align 4
  store i32 %22, i32 addrspace(1)* %19, align 8
  store i32 %24, i32 addrspace(1)* %21, align 4
  store i32 %33, i32 addrspace(1)* %23, align 8
  store i32 %26, i32 addrspace(1)* %25, align 4
  call void @llvm.lifetime.end.p5i8(i64 12, i8 addrspace(5)* %5)
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p5i8.p1i8.i64(i8 addrspace(5)* noalias nocapture writeonly, i8 addrspace(1)* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p1i8.p5i8.i64(i8 addrspace(1)* noalias nocapture writeonly, i8 addrspace(5)* noalias nocapture readonly, i64, i1 immarg) #3

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { argmemonly nocallback nofree nounwind willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
