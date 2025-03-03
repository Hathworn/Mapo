; ModuleID = '../data/hip_kernels/2532/7/main.cu'
source_filename = "../data/hip_kernels/2532/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z4updZPfS_ffii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float %2, float %3, i32 %4, i32 %5) local_unnamed_addr #0 {
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
  br i1 %28, label %29, label %98

29:                                               ; preds = %6
  %30 = add nsw i32 %4, -1
  %31 = icmp slt i32 %15, %30
  br i1 %31, label %32, label %41

32:                                               ; preds = %29
  %33 = add nsw i32 %25, 1
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %1, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !5
  %37 = sext i32 %25 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %1, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !5
  %40 = fsub contract float %36, %39
  br label %41

41:                                               ; preds = %32, %29
  %42 = phi float [ %40, %32 ], [ 0.000000e+00, %29 ]
  %43 = add nsw i32 %5, -1
  %44 = icmp slt i32 %23, %43
  br i1 %44, label %45, label %54

45:                                               ; preds = %41
  %46 = add nsw i32 %25, %4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %1, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !5
  %50 = sext i32 %25 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %1, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !5
  %53 = fsub contract float %49, %52
  br label %54

54:                                               ; preds = %45, %41
  %55 = phi float [ %53, %45 ], [ 0.000000e+00, %41 ]
  %56 = shl nsw i32 %25, 1
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7, !amdgpu.noclobber !5
  %60 = fmul contract float %42, %2
  %61 = fadd contract float %60, %59
  %62 = add nuw nsw i32 %56, 1
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %0, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !5
  %66 = fmul contract float %55, %2
  %67 = fadd contract float %66, %65
  %68 = fmul contract float %61, %61
  %69 = fadd contract float %68, %3
  %70 = fmul contract float %67, %67
  %71 = fadd contract float %69, %70
  %72 = fcmp olt float %71, 0x39F0000000000000
  %73 = select i1 %72, float 0x41F0000000000000, float 1.000000e+00
  %74 = fmul float %71, %73
  %75 = tail call float @llvm.sqrt.f32(float %74)
  %76 = bitcast float %75 to i32
  %77 = add nsw i32 %76, -1
  %78 = bitcast i32 %77 to float
  %79 = add nsw i32 %76, 1
  %80 = bitcast i32 %79 to float
  %81 = tail call i1 @llvm.amdgcn.class.f32(float %74, i32 608)
  %82 = select i1 %72, float 0x3EF0000000000000, float 1.000000e+00
  %83 = fneg float %80
  %84 = tail call float @llvm.fma.f32(float %83, float %75, float %74)
  %85 = fcmp ogt float %84, 0.000000e+00
  %86 = fneg float %78
  %87 = tail call float @llvm.fma.f32(float %86, float %75, float %74)
  %88 = fcmp ole float %87, 0.000000e+00
  %89 = select i1 %88, float %78, float %75
  %90 = select i1 %85, float %80, float %89
  %91 = fmul float %82, %90
  %92 = select i1 %81, float %74, float %91
  %93 = fcmp contract olt float %92, 1.000000e+00
  %94 = fdiv contract float 1.000000e+00, %92
  %95 = select i1 %93, float 1.000000e+00, float %94
  %96 = fmul contract float %61, %95
  store float %96, float addrspace(1)* %58, align 4, !tbaa !7
  %97 = fmul contract float %67, %95
  store float %97, float addrspace(1)* %64, align 4, !tbaa !7
  br label %98

98:                                               ; preds = %54, %6
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
