; ModuleID = '../data/hip_kernels/7676/1/main.cu'
source_filename = "../data/hip_kernels/7676/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12getMeanImagePKdPdmm(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture %1, i64 %2, i64 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = zext i32 %13 to i64
  %15 = icmp ult i64 %14, %3
  br i1 %15, label %16, label %75

16:                                               ; preds = %4
  %17 = getelementptr inbounds double, double addrspace(1)* %1, i64 %14
  store double 0.000000e+00, double addrspace(1)* %17, align 8, !tbaa !7
  %18 = icmp eq i64 %2, 0
  br i1 %18, label %41, label %19

19:                                               ; preds = %16
  %20 = and i64 %2, 3
  %21 = icmp ult i64 %2, 4
  br i1 %21, label %24, label %22

22:                                               ; preds = %19
  %23 = and i64 %2, -4
  br label %45

24:                                               ; preds = %45, %19
  %25 = phi double [ undef, %19 ], [ %71, %45 ]
  %26 = phi double [ 0.000000e+00, %19 ], [ %71, %45 ]
  %27 = phi i64 [ 0, %19 ], [ %72, %45 ]
  %28 = icmp eq i64 %20, 0
  br i1 %28, label %41, label %29

29:                                               ; preds = %24, %29
  %30 = phi double [ %37, %29 ], [ %26, %24 ]
  %31 = phi i64 [ %38, %29 ], [ %27, %24 ]
  %32 = phi i64 [ %39, %29 ], [ 0, %24 ]
  %33 = mul i64 %31, %3
  %34 = add i64 %33, %14
  %35 = getelementptr inbounds double, double addrspace(1)* %0, i64 %34
  %36 = load double, double addrspace(1)* %35, align 8, !tbaa !7
  %37 = fadd contract double %36, %30
  store double %37, double addrspace(1)* %17, align 8, !tbaa !7
  %38 = add nuw i64 %31, 1
  %39 = add i64 %32, 1
  %40 = icmp eq i64 %39, %20
  br i1 %40, label %41, label %29, !llvm.loop !11

41:                                               ; preds = %24, %29, %16
  %42 = phi double [ 0.000000e+00, %16 ], [ %25, %24 ], [ %37, %29 ]
  %43 = uitofp i64 %2 to double
  %44 = fdiv contract double %42, %43
  store double %44, double addrspace(1)* %17, align 8, !tbaa !7
  br label %75

45:                                               ; preds = %45, %22
  %46 = phi double [ 0.000000e+00, %22 ], [ %71, %45 ]
  %47 = phi i64 [ 0, %22 ], [ %72, %45 ]
  %48 = phi i64 [ 0, %22 ], [ %73, %45 ]
  %49 = mul i64 %47, %3
  %50 = add i64 %49, %14
  %51 = getelementptr inbounds double, double addrspace(1)* %0, i64 %50
  %52 = load double, double addrspace(1)* %51, align 8, !tbaa !7
  %53 = fadd contract double %52, %46
  store double %53, double addrspace(1)* %17, align 8, !tbaa !7
  %54 = or i64 %47, 1
  %55 = mul i64 %54, %3
  %56 = add i64 %55, %14
  %57 = getelementptr inbounds double, double addrspace(1)* %0, i64 %56
  %58 = load double, double addrspace(1)* %57, align 8, !tbaa !7
  %59 = fadd contract double %58, %53
  store double %59, double addrspace(1)* %17, align 8, !tbaa !7
  %60 = or i64 %47, 2
  %61 = mul i64 %60, %3
  %62 = add i64 %61, %14
  %63 = getelementptr inbounds double, double addrspace(1)* %0, i64 %62
  %64 = load double, double addrspace(1)* %63, align 8, !tbaa !7
  %65 = fadd contract double %64, %59
  store double %65, double addrspace(1)* %17, align 8, !tbaa !7
  %66 = or i64 %47, 3
  %67 = mul i64 %66, %3
  %68 = add i64 %67, %14
  %69 = getelementptr inbounds double, double addrspace(1)* %0, i64 %68
  %70 = load double, double addrspace(1)* %69, align 8, !tbaa !7
  %71 = fadd contract double %70, %65
  store double %71, double addrspace(1)* %17, align 8, !tbaa !7
  %72 = add nuw i64 %47, 4
  %73 = add i64 %48, 4
  %74 = icmp eq i64 %73, %23
  br i1 %74, label %24, label %45, !llvm.loop !13

75:                                               ; preds = %4, %41
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

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
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
