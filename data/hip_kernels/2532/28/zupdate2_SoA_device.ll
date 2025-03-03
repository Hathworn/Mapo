; ModuleID = '../data/hip_kernels/2532/28/main.cu'
source_filename = "../data/hip_kernels/2532/28/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z12zupdate2_SoAPfS_S_fii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, float %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = mul nsw i32 %23, %4
  %25 = add nsw i32 %24, %15
  %26 = icmp slt i32 %15, %4
  %27 = icmp slt i32 %23, %5
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %88

29:                                               ; preds = %6
  %30 = sext i32 %25 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %2, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !7, !amdgpu.noclobber !5
  %33 = add nsw i32 %25, %4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %2, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !5
  %37 = add nsw i32 %4, -1
  %38 = icmp eq i32 %15, %37
  br i1 %38, label %45, label %39

39:                                               ; preds = %29
  %40 = add nsw i32 %25, 1
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %2, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = fsub contract float %43, %32
  br label %45

45:                                               ; preds = %39, %29
  %46 = phi float [ 0.000000e+00, %29 ], [ %44, %39 ]
  %47 = add nsw i32 %5, -1
  %48 = icmp eq i32 %23, %47
  %49 = fsub contract float %36, %32
  %50 = select i1 %48, float 0.000000e+00, float %49
  %51 = fmul contract float %46, %46
  %52 = fmul contract float %50, %50
  %53 = fadd contract float %52, %51
  %54 = fcmp olt float %53, 0x39F0000000000000
  %55 = select i1 %54, float 0x41F0000000000000, float 1.000000e+00
  %56 = fmul float %53, %55
  %57 = tail call float @llvm.sqrt.f32(float %56)
  %58 = bitcast float %57 to i32
  %59 = add nsw i32 %58, -1
  %60 = bitcast i32 %59 to float
  %61 = add nsw i32 %58, 1
  %62 = bitcast i32 %61 to float
  %63 = tail call i1 @llvm.amdgcn.class.f32(float %56, i32 608)
  %64 = select i1 %54, float 0x3EF0000000000000, float 1.000000e+00
  %65 = fneg float %62
  %66 = tail call float @llvm.fma.f32(float %65, float %57, float %56)
  %67 = fcmp ogt float %66, 0.000000e+00
  %68 = fneg float %60
  %69 = tail call float @llvm.fma.f32(float %68, float %57, float %56)
  %70 = fcmp ole float %69, 0.000000e+00
  %71 = select i1 %70, float %60, float %57
  %72 = select i1 %67, float %62, float %71
  %73 = fmul float %64, %72
  %74 = select i1 %63, float %56, float %73
  %75 = fmul contract float %74, %3
  %76 = fadd contract float %75, 1.000000e+00
  %77 = fdiv contract float 1.000000e+00, %76
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %30
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7, !amdgpu.noclobber !5
  %80 = fmul contract float %46, %3
  %81 = fadd contract float %79, %80
  %82 = fmul contract float %81, %77
  store float %82, float addrspace(1)* %78, align 4, !tbaa !7
  %83 = getelementptr inbounds float, float addrspace(1)* %1, i64 %30
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7
  %85 = fmul contract float %50, %3
  %86 = fadd contract float %85, %84
  %87 = fmul contract float %86, %77
  store float %87, float addrspace(1)* %83, align 4, !tbaa !7
  br label %88

88:                                               ; preds = %45, %6
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
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
