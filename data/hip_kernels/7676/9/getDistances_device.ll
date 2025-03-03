; ModuleID = '../data/hip_kernels/7676/9/main.cu'
source_filename = "../data/hip_kernels/7676/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12getDistancesPKdS0_Pdmmm(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture %2, i64 %3, i64 %4, i64 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = zext i32 %7 to i64
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = zext i32 %17 to i64
  %19 = icmp ult i64 %18, %4
  %20 = icmp ult i64 %8, %3
  %21 = select i1 %19, i1 %20, i1 false
  br i1 %21, label %22, label %78

22:                                               ; preds = %6
  %23 = mul i64 %8, %4
  %24 = add i64 %23, %18
  %25 = getelementptr inbounds double, double addrspace(1)* %2, i64 %24
  store double 0.000000e+00, double addrspace(1)* %25, align 8, !tbaa !7
  %26 = icmp eq i64 %5, 0
  br i1 %26, label %78, label %27

27:                                               ; preds = %22
  %28 = and i64 %5, 1
  %29 = icmp eq i64 %5, 1
  br i1 %29, label %62, label %30

30:                                               ; preds = %27
  %31 = and i64 %5, -2
  br label %32

32:                                               ; preds = %32, %30
  %33 = phi double [ 0.000000e+00, %30 ], [ %58, %32 ]
  %34 = phi i64 [ 0, %30 ], [ %59, %32 ]
  %35 = phi i64 [ 0, %30 ], [ %60, %32 ]
  %36 = mul i64 %34, %3
  %37 = add i64 %36, %8
  %38 = getelementptr inbounds double, double addrspace(1)* %0, i64 %37
  %39 = load double, double addrspace(1)* %38, align 8, !tbaa !7
  %40 = mul i64 %34, %4
  %41 = add i64 %40, %18
  %42 = getelementptr inbounds double, double addrspace(1)* %1, i64 %41
  %43 = load double, double addrspace(1)* %42, align 8, !tbaa !7
  %44 = fsub contract double %39, %43
  %45 = tail call double @llvm.fabs.f64(double %44)
  %46 = fadd contract double %33, %45
  store double %46, double addrspace(1)* %25, align 8, !tbaa !7
  %47 = or i64 %34, 1
  %48 = mul i64 %47, %3
  %49 = add i64 %48, %8
  %50 = getelementptr inbounds double, double addrspace(1)* %0, i64 %49
  %51 = load double, double addrspace(1)* %50, align 8, !tbaa !7
  %52 = mul i64 %47, %4
  %53 = add i64 %52, %18
  %54 = getelementptr inbounds double, double addrspace(1)* %1, i64 %53
  %55 = load double, double addrspace(1)* %54, align 8, !tbaa !7
  %56 = fsub contract double %51, %55
  %57 = tail call double @llvm.fabs.f64(double %56)
  %58 = fadd contract double %46, %57
  store double %58, double addrspace(1)* %25, align 8, !tbaa !7
  %59 = add nuw i64 %34, 2
  %60 = add i64 %35, 2
  %61 = icmp eq i64 %60, %31
  br i1 %61, label %62, label %32, !llvm.loop !11

62:                                               ; preds = %32, %27
  %63 = phi double [ 0.000000e+00, %27 ], [ %58, %32 ]
  %64 = phi i64 [ 0, %27 ], [ %59, %32 ]
  %65 = icmp eq i64 %28, 0
  br i1 %65, label %78, label %66

66:                                               ; preds = %62
  %67 = mul i64 %64, %3
  %68 = add i64 %67, %8
  %69 = getelementptr inbounds double, double addrspace(1)* %0, i64 %68
  %70 = load double, double addrspace(1)* %69, align 8, !tbaa !7
  %71 = mul i64 %64, %4
  %72 = add i64 %71, %18
  %73 = getelementptr inbounds double, double addrspace(1)* %1, i64 %72
  %74 = load double, double addrspace(1)* %73, align 8, !tbaa !7
  %75 = fsub contract double %70, %74
  %76 = tail call double @llvm.fabs.f64(double %75)
  %77 = fadd contract double %63, %76
  store double %77, double addrspace(1)* %25, align 8, !tbaa !7
  br label %78

78:                                               ; preds = %66, %62, %22, %6
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
