; ModuleID = '../data/hip_kernels/7811/30/main.cu'
source_filename = "../data/hip_kernels/7811/30/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z16FilmGradeKernelCPfiifffffff(float addrspace(1)* nocapture %0, i32 %1, i32 %2, float %3, float %4, float %5, float %6, float %7, float %8, float %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %11, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %19 = add i32 %17, %18
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %21 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 2, !range !4, !invariant.load !5
  %24 = zext i16 %23 to i32
  %25 = mul i32 %20, %24
  %26 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %27 = add i32 %25, %26
  %28 = icmp slt i32 %19, %1
  %29 = icmp slt i32 %27, %2
  %30 = select i1 %28, i1 %29, i1 false
  br i1 %30, label %31, label %73

31:                                               ; preds = %10
  %32 = mul nsw i32 %27, %1
  %33 = add nsw i32 %32, %19
  %34 = shl nsw i32 %33, 2
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !5
  %38 = fsub contract float %37, %9
  %39 = fmul contract float %38, %3
  %40 = fadd contract float %39, %9
  %41 = add nuw nsw i32 %34, 1
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7, !amdgpu.noclobber !5
  %45 = fsub contract float %44, %9
  %46 = fmul contract float %45, %4
  %47 = fadd contract float %46, %9
  %48 = add nuw nsw i32 %34, 2
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %0, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !7, !amdgpu.noclobber !5
  %52 = fsub contract float %51, %9
  %53 = fmul contract float %52, %5
  %54 = fadd contract float %53, %9
  %55 = fmul contract float %40, 0x3FCB367A00000000
  %56 = fmul contract float %47, 0x3FE6E2EB20000000
  %57 = fadd contract float %55, %56
  %58 = fmul contract float %54, 0x3FB27BB300000000
  %59 = fadd contract float %57, %58
  %60 = fmul contract float %6, 0x3FCB367A00000000
  %61 = fmul contract float %7, 0x3FE6E2EB20000000
  %62 = fadd contract float %60, %61
  %63 = fmul contract float %8, 0x3FB27BB300000000
  %64 = fadd contract float %62, %63
  %65 = fsub contract float 1.000000e+00, %64
  %66 = fmul contract float %65, %59
  %67 = fmul contract float %40, %6
  %68 = fadd contract float %67, %66
  %69 = fmul contract float %47, %7
  %70 = fadd contract float %69, %66
  %71 = fmul contract float %54, %8
  %72 = fadd contract float %71, %66
  store float %68, float addrspace(1)* %36, align 4, !tbaa !7
  store float %70, float addrspace(1)* %43, align 4, !tbaa !7
  store float %72, float addrspace(1)* %50, align 4, !tbaa !7
  br label %73

73:                                               ; preds = %31, %10
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
