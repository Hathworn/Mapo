; ModuleID = '../data/hip_kernels/611/1/main.cu'
source_filename = "../data/hip_kernels/611/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z8vignettePKhPhffmm(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, float %2, float %3, i64 %4, i64 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = zext i32 %15 to i64
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %24 = add i32 %22, %23
  %25 = zext i32 %24 to i64
  %26 = icmp ult i64 %16, %4
  %27 = icmp ult i64 %25, %5
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %85

29:                                               ; preds = %6
  %30 = mul i64 %25, %4
  %31 = add i64 %30, %16
  %32 = uitofp i32 %15 to float
  %33 = uitofp i64 %5 to float
  %34 = fdiv contract float %32, %33
  %35 = uitofp i64 %4 to float
  %36 = fdiv contract float %35, %33
  %37 = fmul contract float %36, 5.000000e-01
  %38 = fsub contract float %34, %37
  %39 = uitofp i32 %24 to float
  %40 = fdiv contract float %39, %33
  %41 = fadd contract float %40, -5.000000e-01
  %42 = fmul contract float %38, %38
  %43 = fmul contract float %41, %41
  %44 = fadd contract float %42, %43
  %45 = fcmp olt float %44, 0x39F0000000000000
  %46 = select i1 %45, float 0x41F0000000000000, float 1.000000e+00
  %47 = fmul float %44, %46
  %48 = tail call float @llvm.sqrt.f32(float %47)
  %49 = bitcast float %48 to i32
  %50 = add nsw i32 %49, -1
  %51 = bitcast i32 %50 to float
  %52 = add nsw i32 %49, 1
  %53 = bitcast i32 %52 to float
  %54 = tail call i1 @llvm.amdgcn.class.f32(float %47, i32 608)
  %55 = select i1 %45, float 0x3EF0000000000000, float 1.000000e+00
  %56 = fneg float %53
  %57 = tail call float @llvm.fma.f32(float %56, float %48, float %47)
  %58 = fcmp ogt float %57, 0.000000e+00
  %59 = fneg float %51
  %60 = tail call float @llvm.fma.f32(float %59, float %48, float %47)
  %61 = fcmp ole float %60, 0.000000e+00
  %62 = select i1 %61, float %51, float %48
  %63 = select i1 %58, float %53, float %62
  %64 = fmul float %55, %63
  %65 = select i1 %54, float %47, float %64
  %66 = fcmp contract olt float %65, %2
  br i1 %66, label %67, label %70

67:                                               ; preds = %29
  %68 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %31
  %69 = load i8, i8 addrspace(1)* %68, align 1, !tbaa !7, !amdgpu.noclobber !5
  br label %82

70:                                               ; preds = %29
  %71 = fcmp contract ogt float %65, %3
  br i1 %71, label %82, label %72

72:                                               ; preds = %70
  %73 = fsub contract float %65, %2
  %74 = fsub contract float %3, %2
  %75 = fdiv contract float %73, %74
  %76 = fsub contract float 1.000000e+00, %75
  %77 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %31
  %78 = load i8, i8 addrspace(1)* %77, align 1, !tbaa !7, !amdgpu.noclobber !5
  %79 = uitofp i8 %78 to float
  %80 = fmul contract float %76, %79
  %81 = fptoui float %80 to i8
  br label %82

82:                                               ; preds = %70, %72, %67
  %83 = phi i8 [ %69, %67 ], [ %81, %72 ], [ 0, %70 ]
  %84 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %31
  store i8 %83, i8 addrspace(1)* %84, align 1, !tbaa !7
  br label %85

85:                                               ; preds = %82, %6
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
