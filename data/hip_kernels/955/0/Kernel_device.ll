; ModuleID = '../data/hip_kernels/955/0/main.cu'
source_filename = "../data/hip_kernels/955/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z6KernelPdj(double addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = add i32 %10, %3
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %14

13:                                               ; preds = %2
  store double 0.000000e+00, double addrspace(1)* %0, align 8, !tbaa !7
  br label %44

14:                                               ; preds = %2
  %15 = add i32 %1, -1
  %16 = icmp eq i32 %11, %15
  br i1 %16, label %17, label %25

17:                                               ; preds = %14
  %18 = add i32 %1, -2
  %19 = zext i32 %18 to i64
  %20 = getelementptr inbounds double, double addrspace(1)* %0, i64 %19
  %21 = load double, double addrspace(1)* %20, align 8, !tbaa !7, !amdgpu.noclobber !6
  %22 = fadd contract double %21, 5.000000e+00
  %23 = zext i32 %11 to i64
  %24 = getelementptr inbounds double, double addrspace(1)* %0, i64 %23
  store double %22, double addrspace(1)* %24, align 8, !tbaa !7
  br label %44

25:                                               ; preds = %14
  %26 = icmp ult i32 %11, %1
  br i1 %26, label %27, label %44

27:                                               ; preds = %25
  %28 = add nuw nsw i32 %11, 1
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds double, double addrspace(1)* %0, i64 %29
  %31 = load double, double addrspace(1)* %30, align 8, !tbaa !7, !amdgpu.noclobber !6
  %32 = sext i32 %11 to i64
  %33 = getelementptr inbounds double, double addrspace(1)* %0, i64 %32
  %34 = load double, double addrspace(1)* %33, align 8, !tbaa !7, !amdgpu.noclobber !6
  %35 = fmul contract double %34, 2.000000e+00
  %36 = fsub contract double %31, %35
  %37 = add nsw i32 %11, -1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds double, double addrspace(1)* %0, i64 %38
  %40 = load double, double addrspace(1)* %39, align 8, !tbaa !7, !amdgpu.noclobber !6
  %41 = fadd contract double %40, %36
  %42 = fmul contract double %41, 1.000000e-01
  %43 = fadd contract double %34, %42
  store double %43, double addrspace(1)* %33, align 8, !tbaa !7
  br label %44

44:                                               ; preds = %17, %27, %25, %13
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
