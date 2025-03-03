; ModuleID = '../data/hip_kernels/7676/2/main.cu'
source_filename = "../data/hip_kernels/7676/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12subtractMeanPdPKdmm(double addrspace(1)* nocapture %0, double addrspace(1)* nocapture readonly %1, i64 %2, i64 %3) local_unnamed_addr #0 {
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
  %16 = icmp ne i64 %2, 0
  %17 = select i1 %15, i1 %16, i1 false
  br i1 %17, label %18, label %82

18:                                               ; preds = %4
  %19 = getelementptr inbounds double, double addrspace(1)* %1, i64 %14
  %20 = and i64 %2, 3
  %21 = icmp ult i64 %2, 4
  br i1 %21, label %65, label %22

22:                                               ; preds = %18
  %23 = and i64 %2, -4
  br label %24

24:                                               ; preds = %24, %22
  %25 = phi i64 [ 0, %22 ], [ %62, %24 ]
  %26 = phi i64 [ 0, %22 ], [ %63, %24 ]
  %27 = load double, double addrspace(1)* %19, align 8, !tbaa !7
  %28 = mul i64 %25, %3
  %29 = add i64 %28, %14
  %30 = getelementptr inbounds double, double addrspace(1)* %0, i64 %29
  %31 = load double, double addrspace(1)* %30, align 8, !tbaa !7
  %32 = fsub contract double %31, %27
  %33 = fcmp contract olt double %32, 0.000000e+00
  %34 = select i1 %33, double 0.000000e+00, double %32
  store double %34, double addrspace(1)* %30, align 8, !tbaa !7
  %35 = or i64 %25, 1
  %36 = load double, double addrspace(1)* %19, align 8, !tbaa !7
  %37 = mul i64 %35, %3
  %38 = add i64 %37, %14
  %39 = getelementptr inbounds double, double addrspace(1)* %0, i64 %38
  %40 = load double, double addrspace(1)* %39, align 8, !tbaa !7
  %41 = fsub contract double %40, %36
  %42 = fcmp contract olt double %41, 0.000000e+00
  %43 = select i1 %42, double 0.000000e+00, double %41
  store double %43, double addrspace(1)* %39, align 8, !tbaa !7
  %44 = or i64 %25, 2
  %45 = load double, double addrspace(1)* %19, align 8, !tbaa !7
  %46 = mul i64 %44, %3
  %47 = add i64 %46, %14
  %48 = getelementptr inbounds double, double addrspace(1)* %0, i64 %47
  %49 = load double, double addrspace(1)* %48, align 8, !tbaa !7
  %50 = fsub contract double %49, %45
  %51 = fcmp contract olt double %50, 0.000000e+00
  %52 = select i1 %51, double 0.000000e+00, double %50
  store double %52, double addrspace(1)* %48, align 8, !tbaa !7
  %53 = or i64 %25, 3
  %54 = load double, double addrspace(1)* %19, align 8, !tbaa !7
  %55 = mul i64 %53, %3
  %56 = add i64 %55, %14
  %57 = getelementptr inbounds double, double addrspace(1)* %0, i64 %56
  %58 = load double, double addrspace(1)* %57, align 8, !tbaa !7
  %59 = fsub contract double %58, %54
  %60 = fcmp contract olt double %59, 0.000000e+00
  %61 = select i1 %60, double 0.000000e+00, double %59
  store double %61, double addrspace(1)* %57, align 8, !tbaa !7
  %62 = add nuw i64 %25, 4
  %63 = add i64 %26, 4
  %64 = icmp eq i64 %63, %23
  br i1 %64, label %65, label %24, !llvm.loop !11

65:                                               ; preds = %24, %18
  %66 = phi i64 [ 0, %18 ], [ %62, %24 ]
  %67 = icmp eq i64 %20, 0
  br i1 %67, label %82, label %68

68:                                               ; preds = %65, %68
  %69 = phi i64 [ %79, %68 ], [ %66, %65 ]
  %70 = phi i64 [ %80, %68 ], [ 0, %65 ]
  %71 = load double, double addrspace(1)* %19, align 8, !tbaa !7
  %72 = mul i64 %69, %3
  %73 = add i64 %72, %14
  %74 = getelementptr inbounds double, double addrspace(1)* %0, i64 %73
  %75 = load double, double addrspace(1)* %74, align 8, !tbaa !7
  %76 = fsub contract double %75, %71
  %77 = fcmp contract olt double %76, 0.000000e+00
  %78 = select i1 %77, double 0.000000e+00, double %76
  store double %78, double addrspace(1)* %74, align 8, !tbaa !7
  %79 = add nuw i64 %69, 1
  %80 = add i64 %70, 1
  %81 = icmp eq i64 %80, %20
  br i1 %81, label %82, label %68, !llvm.loop !13

82:                                               ; preds = %65, %68, %4
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
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
