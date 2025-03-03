; ModuleID = '../data/hip_kernels/14174/4/main.cu'
source_filename = "../data/hip_kernels/14174/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z5huberPfmmffmS_(float addrspace(1)* nocapture %0, i64 %1, i64 %2, float %3, float %4, i64 %5, float addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = zext i32 %16 to i64
  %18 = freeze i64 %17
  %19 = freeze i64 %1
  %20 = udiv i64 %18, %19
  %21 = mul i64 %20, %19
  %22 = sub i64 %18, %21
  %23 = mul i64 %20, %5
  %24 = icmp ult i64 %23, %2
  br i1 %24, label %25, label %75

25:                                               ; preds = %7
  %26 = add i64 %23, %5
  %27 = trunc i64 %26 to i32
  %28 = trunc i64 %2 to i32
  %29 = tail call i32 @llvm.umin.i32(i32 %27, i32 %28)
  %30 = zext i32 %29 to i64
  %31 = fmul contract float %3, %3
  %32 = icmp ult i64 %23, %30
  br i1 %32, label %37, label %33

33:                                               ; preds = %37, %25
  %34 = phi float [ 0.000000e+00, %25 ], [ %70, %37 ]
  %35 = fmul contract float %34, %4
  %36 = getelementptr inbounds float, float addrspace(1)* %6, i64 %17
  store float %35, float addrspace(1)* %36, align 4, !tbaa !7
  br label %75

37:                                               ; preds = %25, %37
  %38 = phi float [ %70, %37 ], [ 0.000000e+00, %25 ]
  %39 = phi i64 [ %73, %37 ], [ %23, %25 ]
  %40 = mul i64 %39, %1
  %41 = add i64 %40, %22
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7
  %44 = fmul contract float %43, %43
  %45 = fdiv contract float %44, %31
  %46 = fadd contract float %45, 1.000000e+00
  %47 = fcmp olt float %46, 0x39F0000000000000
  %48 = select i1 %47, float 0x41F0000000000000, float 1.000000e+00
  %49 = fmul float %46, %48
  %50 = tail call float @llvm.sqrt.f32(float %49)
  %51 = bitcast float %50 to i32
  %52 = add nsw i32 %51, -1
  %53 = bitcast i32 %52 to float
  %54 = add nsw i32 %51, 1
  %55 = bitcast i32 %54 to float
  %56 = tail call i1 @llvm.amdgcn.class.f32(float %49, i32 608)
  %57 = select i1 %47, float 0x3EF0000000000000, float 1.000000e+00
  %58 = fneg float %55
  %59 = tail call float @llvm.fma.f32(float %58, float %50, float %49)
  %60 = fcmp ogt float %59, 0.000000e+00
  %61 = fneg float %53
  %62 = tail call float @llvm.fma.f32(float %61, float %50, float %49)
  %63 = fcmp ole float %62, 0.000000e+00
  %64 = select i1 %63, float %53, float %50
  %65 = select i1 %60, float %55, float %64
  %66 = fmul float %57, %65
  %67 = select i1 %56, float %49, float %66
  %68 = fadd contract float %67, -1.000000e+00
  %69 = fmul contract float %31, %68
  %70 = fadd contract float %38, %69
  %71 = fdiv contract float %4, %67
  %72 = fmul contract float %43, %71
  store float %72, float addrspace(1)* %42, align 4, !tbaa !7
  %73 = add nuw nsw i64 %39, 1
  %74 = icmp ult i64 %73, %30
  br i1 %74, label %37, label %33, !llvm.loop !11

75:                                               ; preds = %7, %33
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

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umin.i32(i32, i32) #1

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
