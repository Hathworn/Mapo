; ModuleID = '../data/hip_kernels/2532/25/main.cu'
source_filename = "../data/hip_kernels/2532/25/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z13zupdate_interPffii(float addrspace(1)* nocapture %0, float %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = mul nsw i32 %21, %2
  %23 = add nsw i32 %22, %13
  %24 = icmp slt i32 %13, %2
  %25 = icmp slt i32 %21, %3
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %103

27:                                               ; preds = %4
  %28 = add nsw i32 %2, -1
  %29 = icmp slt i32 %13, %28
  br i1 %29, label %30, label %41

30:                                               ; preds = %27
  %31 = mul i32 %23, 3
  %32 = add i32 %31, 5
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %0, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = add nsw i32 %31, 2
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !5
  %40 = fsub contract float %35, %39
  br label %41

41:                                               ; preds = %30, %27
  %42 = phi float [ %40, %30 ], [ 0.000000e+00, %27 ]
  %43 = add nsw i32 %3, -1
  %44 = icmp slt i32 %21, %43
  br i1 %44, label %47, label %45

45:                                               ; preds = %41
  %46 = mul nsw i32 %23, 3
  br label %60

47:                                               ; preds = %41
  %48 = add nsw i32 %23, %2
  %49 = mul nsw i32 %48, 3
  %50 = add nsw i32 %49, 2
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %0, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7, !amdgpu.noclobber !5
  %54 = mul nsw i32 %23, 3
  %55 = add nsw i32 %54, 2
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %0, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !7, !amdgpu.noclobber !5
  %59 = fsub contract float %53, %58
  br label %60

60:                                               ; preds = %45, %47
  %61 = phi i32 [ %46, %45 ], [ %54, %47 ]
  %62 = phi float [ 0.000000e+00, %45 ], [ %59, %47 ]
  %63 = fmul contract float %42, %42
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
  %87 = fmul contract float %86, %1
  %88 = fadd contract float %87, 1.000000e+00
  %89 = fdiv contract float 1.000000e+00, %88
  %90 = sext i32 %61 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %0, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7, !amdgpu.noclobber !5
  %93 = fmul contract float %42, %1
  %94 = fadd contract float %93, %92
  %95 = fmul contract float %94, %89
  store float %95, float addrspace(1)* %91, align 4, !tbaa !7
  %96 = add nsw i32 %61, 1
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %0, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !7, !amdgpu.noclobber !5
  %100 = fmul contract float %62, %1
  %101 = fadd contract float %100, %99
  %102 = fmul contract float %101, %89
  store float %102, float addrspace(1)* %98, align 4, !tbaa !7
  br label %103

103:                                              ; preds = %60, %4
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
