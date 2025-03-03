; ModuleID = '../data/hip_kernels/49/43/main.cu'
source_filename = "../data/hip_kernels/49/43/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12kDumbSumColsPfS_jj(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
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
  %15 = icmp ult i32 %13, %2
  br i1 %15, label %16, label %72

16:                                               ; preds = %4
  %17 = icmp eq i32 %3, 0
  br i1 %17, label %39, label %18

18:                                               ; preds = %16
  %19 = getelementptr inbounds float, float addrspace(1)* %0, i64 %14
  %20 = zext i32 %2 to i64
  %21 = and i32 %3, 7
  %22 = icmp ult i32 %3, 8
  br i1 %22, label %25, label %23

23:                                               ; preds = %18
  %24 = and i32 %3, -8
  br label %42

25:                                               ; preds = %42, %18
  %26 = phi float [ undef, %18 ], [ %68, %42 ]
  %27 = phi float [ 0.000000e+00, %18 ], [ %68, %42 ]
  %28 = phi float addrspace(1)* [ %19, %18 ], [ %69, %42 ]
  %29 = icmp eq i32 %21, 0
  br i1 %29, label %39, label %30

30:                                               ; preds = %25, %30
  %31 = phi float [ %35, %30 ], [ %27, %25 ]
  %32 = phi float addrspace(1)* [ %36, %30 ], [ %28, %25 ]
  %33 = phi i32 [ %37, %30 ], [ 0, %25 ]
  %34 = load float, float addrspace(1)* %32, align 4, !tbaa !7
  %35 = fadd contract float %31, %34
  %36 = getelementptr inbounds float, float addrspace(1)* %32, i64 %20
  %37 = add i32 %33, 1
  %38 = icmp eq i32 %37, %21
  br i1 %38, label %39, label %30, !llvm.loop !11

39:                                               ; preds = %25, %30, %16
  %40 = phi float [ 0.000000e+00, %16 ], [ %26, %25 ], [ %35, %30 ]
  %41 = getelementptr inbounds float, float addrspace(1)* %1, i64 %14
  store float %40, float addrspace(1)* %41, align 4, !tbaa !7
  br label %72

42:                                               ; preds = %42, %23
  %43 = phi float [ 0.000000e+00, %23 ], [ %68, %42 ]
  %44 = phi float addrspace(1)* [ %19, %23 ], [ %69, %42 ]
  %45 = phi i32 [ 0, %23 ], [ %70, %42 ]
  %46 = load float, float addrspace(1)* %44, align 4, !tbaa !7
  %47 = fadd contract float %43, %46
  %48 = getelementptr inbounds float, float addrspace(1)* %44, i64 %20
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7
  %50 = fadd contract float %47, %49
  %51 = getelementptr inbounds float, float addrspace(1)* %48, i64 %20
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7
  %53 = fadd contract float %50, %52
  %54 = getelementptr inbounds float, float addrspace(1)* %51, i64 %20
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7
  %56 = fadd contract float %53, %55
  %57 = getelementptr inbounds float, float addrspace(1)* %54, i64 %20
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !7
  %59 = fadd contract float %56, %58
  %60 = getelementptr inbounds float, float addrspace(1)* %57, i64 %20
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !7
  %62 = fadd contract float %59, %61
  %63 = getelementptr inbounds float, float addrspace(1)* %60, i64 %20
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7
  %65 = fadd contract float %62, %64
  %66 = getelementptr inbounds float, float addrspace(1)* %63, i64 %20
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7
  %68 = fadd contract float %65, %67
  %69 = getelementptr inbounds float, float addrspace(1)* %66, i64 %20
  %70 = add i32 %45, 8
  %71 = icmp eq i32 %70, %24
  br i1 %71, label %25, label %42, !llvm.loop !13

72:                                               ; preds = %39, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
