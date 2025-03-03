; ModuleID = '../data/hip_kernels/7676/5/main.cu'
source_filename = "../data/hip_kernels/7676/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19restoreEigenvectorsPKdS0_Pdmmm(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture %2, i64 %3, i64 %4, i64 %5) local_unnamed_addr #0 {
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
  %20 = icmp ult i64 %8, %5
  %21 = select i1 %19, i1 %20, i1 false
  br i1 %21, label %22, label %101

22:                                               ; preds = %6
  %23 = mul i64 %8, %4
  %24 = add i64 %23, %18
  %25 = getelementptr inbounds double, double addrspace(1)* %2, i64 %24
  store double 0.000000e+00, double addrspace(1)* %25, align 8, !tbaa !7
  %26 = icmp eq i64 %3, 0
  br i1 %26, label %101, label %27

27:                                               ; preds = %22
  %28 = xor i64 %8, -1
  %29 = add i64 %28, %3
  %30 = mul i64 %29, %3
  %31 = and i64 %3, 3
  %32 = icmp ult i64 %3, 4
  br i1 %32, label %81, label %33

33:                                               ; preds = %27
  %34 = and i64 %3, -4
  br label %35

35:                                               ; preds = %35, %33
  %36 = phi double [ 0.000000e+00, %33 ], [ %77, %35 ]
  %37 = phi i64 [ 0, %33 ], [ %78, %35 ]
  %38 = phi i64 [ 0, %33 ], [ %79, %35 ]
  %39 = add i64 %37, %30
  %40 = getelementptr inbounds double, double addrspace(1)* %1, i64 %39
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !7
  %42 = mul i64 %37, %4
  %43 = add i64 %42, %18
  %44 = getelementptr inbounds double, double addrspace(1)* %0, i64 %43
  %45 = load double, double addrspace(1)* %44, align 8, !tbaa !7
  %46 = fmul contract double %41, %45
  %47 = fadd contract double %36, %46
  store double %47, double addrspace(1)* %25, align 8, !tbaa !7
  %48 = or i64 %37, 1
  %49 = add i64 %48, %30
  %50 = getelementptr inbounds double, double addrspace(1)* %1, i64 %49
  %51 = load double, double addrspace(1)* %50, align 8, !tbaa !7
  %52 = mul i64 %48, %4
  %53 = add i64 %52, %18
  %54 = getelementptr inbounds double, double addrspace(1)* %0, i64 %53
  %55 = load double, double addrspace(1)* %54, align 8, !tbaa !7
  %56 = fmul contract double %51, %55
  %57 = fadd contract double %47, %56
  store double %57, double addrspace(1)* %25, align 8, !tbaa !7
  %58 = or i64 %37, 2
  %59 = add i64 %58, %30
  %60 = getelementptr inbounds double, double addrspace(1)* %1, i64 %59
  %61 = load double, double addrspace(1)* %60, align 8, !tbaa !7
  %62 = mul i64 %58, %4
  %63 = add i64 %62, %18
  %64 = getelementptr inbounds double, double addrspace(1)* %0, i64 %63
  %65 = load double, double addrspace(1)* %64, align 8, !tbaa !7
  %66 = fmul contract double %61, %65
  %67 = fadd contract double %57, %66
  store double %67, double addrspace(1)* %25, align 8, !tbaa !7
  %68 = or i64 %37, 3
  %69 = add i64 %68, %30
  %70 = getelementptr inbounds double, double addrspace(1)* %1, i64 %69
  %71 = load double, double addrspace(1)* %70, align 8, !tbaa !7
  %72 = mul i64 %68, %4
  %73 = add i64 %72, %18
  %74 = getelementptr inbounds double, double addrspace(1)* %0, i64 %73
  %75 = load double, double addrspace(1)* %74, align 8, !tbaa !7
  %76 = fmul contract double %71, %75
  %77 = fadd contract double %67, %76
  store double %77, double addrspace(1)* %25, align 8, !tbaa !7
  %78 = add nuw i64 %37, 4
  %79 = add i64 %38, 4
  %80 = icmp eq i64 %79, %34
  br i1 %80, label %81, label %35, !llvm.loop !11

81:                                               ; preds = %35, %27
  %82 = phi double [ 0.000000e+00, %27 ], [ %77, %35 ]
  %83 = phi i64 [ 0, %27 ], [ %78, %35 ]
  %84 = icmp eq i64 %31, 0
  br i1 %84, label %101, label %85

85:                                               ; preds = %81, %85
  %86 = phi double [ %97, %85 ], [ %82, %81 ]
  %87 = phi i64 [ %98, %85 ], [ %83, %81 ]
  %88 = phi i64 [ %99, %85 ], [ 0, %81 ]
  %89 = add i64 %87, %30
  %90 = getelementptr inbounds double, double addrspace(1)* %1, i64 %89
  %91 = load double, double addrspace(1)* %90, align 8, !tbaa !7
  %92 = mul i64 %87, %4
  %93 = add i64 %92, %18
  %94 = getelementptr inbounds double, double addrspace(1)* %0, i64 %93
  %95 = load double, double addrspace(1)* %94, align 8, !tbaa !7
  %96 = fmul contract double %91, %95
  %97 = fadd contract double %86, %96
  store double %97, double addrspace(1)* %25, align 8, !tbaa !7
  %98 = add nuw i64 %87, 1
  %99 = add i64 %88, 1
  %100 = icmp eq i64 %99, %31
  br i1 %100, label %101, label %85, !llvm.loop !13

101:                                              ; preds = %81, %85, %22, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
