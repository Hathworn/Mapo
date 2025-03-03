; ModuleID = '../data/hip_kernels/2532/11/main.cu'
source_filename = "../data/hip_kernels/2532/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10updhgZ_SoAPfS_S_ffii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, float %3, float %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %24 = add i32 %22, %23
  %25 = mul nsw i32 %24, %5
  %26 = add nsw i32 %25, %16
  %27 = icmp slt i32 %16, %5
  %28 = icmp slt i32 %24, %6
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %30, label %91

30:                                               ; preds = %7
  %31 = sext i32 %26 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %2, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !5
  %34 = add nsw i32 %5, -1
  %35 = icmp slt i32 %16, %34
  br i1 %35, label %36, label %42

36:                                               ; preds = %30
  %37 = add nsw i32 %26, 1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %2, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !7, !amdgpu.noclobber !5
  %41 = fsub contract float %40, %33
  br label %42

42:                                               ; preds = %36, %30
  %43 = phi float [ %41, %36 ], [ 0.000000e+00, %30 ]
  %44 = add nsw i32 %6, -1
  %45 = icmp slt i32 %24, %44
  br i1 %45, label %46, label %52

46:                                               ; preds = %42
  %47 = add nsw i32 %26, %5
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %2, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7, !amdgpu.noclobber !5
  %51 = fsub contract float %50, %33
  br label %52

52:                                               ; preds = %46, %42
  %53 = phi float [ %51, %46 ], [ 0.000000e+00, %42 ]
  %54 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7, !amdgpu.noclobber !5
  %56 = fmul contract float %3, %4
  %57 = fmul contract float %56, %43
  %58 = fadd contract float %57, %55
  %59 = getelementptr inbounds float, float addrspace(1)* %1, i64 %31
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7, !amdgpu.noclobber !5
  %61 = fmul contract float %56, %53
  %62 = fadd contract float %61, %60
  %63 = fmul contract float %58, %58
  %64 = fmul contract float %62, %62
  %65 = fadd contract float %63, %64
  %66 = fcmp olt float %65, 0x39F0000000000000
  %67 = select i1 %66, float 0x41F0000000000000, float 1.000000e+00
  %68 = fmul float %65, %67
  %69 = tail call float @llvm.sqrt.f32(float %68)
  %70 = bitcast float %69 to i32
  %71 = add nsw i32 %70, -1
  %72 = bitcast i32 %71 to float
  %73 = add nsw i32 %70, 1
  %74 = bitcast i32 %73 to float
  %75 = tail call i1 @llvm.amdgcn.class.f32(float %68, i32 608)
  %76 = select i1 %66, float 0x3EF0000000000000, float 1.000000e+00
  %77 = fneg float %74
  %78 = tail call float @llvm.fma.f32(float %77, float %69, float %68)
  %79 = fcmp ogt float %78, 0.000000e+00
  %80 = fneg float %72
  %81 = tail call float @llvm.fma.f32(float %80, float %69, float %68)
  %82 = fcmp ole float %81, 0.000000e+00
  %83 = select i1 %82, float %72, float %69
  %84 = select i1 %79, float %74, float %83
  %85 = fmul float %76, %84
  %86 = select i1 %75, float %68, float %85
  %87 = fcmp contract ole float %86, 1.000000e+00
  %88 = select contract i1 %87, float 1.000000e+00, float %86
  %89 = fdiv contract float %58, %88
  store float %89, float addrspace(1)* %54, align 4, !tbaa !7
  %90 = fdiv contract float %62, %88
  store float %90, float addrspace(1)* %59, align 4, !tbaa !7
  br label %91

91:                                               ; preds = %52, %7
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
