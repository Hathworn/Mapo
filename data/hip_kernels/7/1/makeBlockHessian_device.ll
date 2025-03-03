; ModuleID = '../data/hip_kernels/7/1/main.cu'
source_filename = "../data/hip_kernels/7/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16makeBlockHessianPfS_S_S_fPiS0_iS0_S0_ii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, i32 %7, i32 addrspace(1)* nocapture readonly %8, i32 addrspace(1)* nocapture readnone %9, i32 %10, i32 %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %13, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %21 = add i32 %19, %20
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %22
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !7, !amdgpu.noclobber !5
  %25 = mul nsw i32 %24, 3
  %26 = add nsw i32 %25, %10
  %27 = sdiv i32 %26, 3
  %28 = icmp slt i32 %27, %11
  br i1 %28, label %29, label %96

29:                                               ; preds = %12
  %30 = add nsw i32 %7, -1
  %31 = icmp eq i32 %21, %30
  br i1 %31, label %38, label %32

32:                                               ; preds = %29
  %33 = add nsw i32 %21, 1
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %34
  %36 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !5
  %37 = icmp slt i32 %27, %36
  br i1 %37, label %38, label %96

38:                                               ; preds = %32, %29
  %39 = phi i32 [ %11, %29 ], [ %36, %32 ]
  %40 = mul nsw i32 %39, 3
  %41 = icmp slt i32 %25, %40
  br i1 %41, label %42, label %96

42:                                               ; preds = %38
  %43 = sext i32 %27 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %3, i64 %43
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %22
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %22
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !7, !amdgpu.noclobber !5
  %49 = add i32 %46, %10
  br label %50

50:                                               ; preds = %42, %50
  %51 = phi i32 [ %25, %42 ], [ %94, %50 ]
  %52 = load float, float addrspace(1)* %44, align 4, !tbaa !11
  %53 = sdiv i32 %51, 3
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %3, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !11
  %57 = fmul contract float %52, %56
  %58 = fcmp olt float %57, 0x39F0000000000000
  %59 = select i1 %58, float 0x41F0000000000000, float 1.000000e+00
  %60 = fmul float %57, %59
  %61 = tail call float @llvm.sqrt.f32(float %60)
  %62 = bitcast float %61 to i32
  %63 = add nsw i32 %62, -1
  %64 = bitcast i32 %63 to float
  %65 = add nsw i32 %62, 1
  %66 = bitcast i32 %65 to float
  %67 = tail call i1 @llvm.amdgcn.class.f32(float %60, i32 608)
  %68 = select i1 %58, float 0x3EF0000000000000, float 1.000000e+00
  %69 = fneg float %66
  %70 = tail call float @llvm.fma.f32(float %69, float %61, float %60)
  %71 = fcmp ogt float %70, 0.000000e+00
  %72 = fneg float %64
  %73 = tail call float @llvm.fma.f32(float %72, float %61, float %60)
  %74 = fcmp ole float %73, 0.000000e+00
  %75 = select i1 %74, float %64, float %61
  %76 = select i1 %71, float %66, float %75
  %77 = fmul float %68, %76
  %78 = select i1 %67, float %60, float %77
  %79 = fmul contract float %78, %4
  %80 = fdiv contract float 1.000000e+00, %79
  %81 = sext i32 %51 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %1, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !11
  %84 = getelementptr inbounds float, float addrspace(1)* %2, i64 %81
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !11
  %86 = fsub contract float %83, %85
  %87 = fmul contract float %86, %80
  %88 = sub nsw i32 %51, %25
  %89 = mul i32 %88, 3
  %90 = mul i32 %89, %48
  %91 = add i32 %49, %90
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %0, i64 %92
  store float %87, float addrspace(1)* %93, align 4, !tbaa !11
  %94 = add nsw i32 %51, 1
  %95 = icmp slt i32 %94, %40
  br i1 %95, label %50, label %96, !llvm.loop !13

96:                                               ; preds = %50, %38, %12, %32
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
