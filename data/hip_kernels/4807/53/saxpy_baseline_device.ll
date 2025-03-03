; ModuleID = '../data/hip_kernels/4807/53/main.cu'
source_filename = "../data/hip_kernels/4807/53/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14saxpy_baselinePfS_fPl(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float %2, i64 addrspace(1)* nocapture readnone %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = mul i32 %5, 768
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = add i32 %6, %7
  br label %10

9:                                                ; preds = %10
  ret void

10:                                               ; preds = %10, %4
  %11 = phi i32 [ 0, %4 ], [ %91, %10 ]
  %12 = mul nuw nsw i32 %11, 10752
  %13 = add i32 %8, %12
  %14 = zext i32 %13 to i64
  %15 = getelementptr inbounds float, float addrspace(1)* %1, i64 %14
  %16 = load float, float addrspace(1)* %15, align 4, !tbaa !5
  %17 = fmul contract float %16, %2
  %18 = getelementptr inbounds float, float addrspace(1)* %0, i64 %14
  %19 = load float, float addrspace(1)* %18, align 4, !tbaa !5
  %20 = fadd contract float %17, %19
  store float %20, float addrspace(1)* %18, align 4, !tbaa !5
  %21 = mul nuw i32 %11, 10752
  %22 = add nuw i32 %21, 10752
  %23 = add i32 %8, %22
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %1, i64 %24
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !5
  %27 = fmul contract float %26, %2
  %28 = getelementptr inbounds float, float addrspace(1)* %0, i64 %24
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !5
  %30 = fadd contract float %27, %29
  store float %30, float addrspace(1)* %28, align 4, !tbaa !5
  %31 = mul nuw i32 %11, 10752
  %32 = add nuw i32 %31, 21504
  %33 = add i32 %8, %32
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %1, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !5
  %37 = fmul contract float %36, %2
  %38 = getelementptr inbounds float, float addrspace(1)* %0, i64 %34
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !5
  %40 = fadd contract float %37, %39
  store float %40, float addrspace(1)* %38, align 4, !tbaa !5
  %41 = mul nuw i32 %11, 10752
  %42 = add nuw i32 %41, 32256
  %43 = add i32 %8, %42
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %1, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !5
  %47 = fmul contract float %46, %2
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !5
  %50 = fadd contract float %47, %49
  store float %50, float addrspace(1)* %48, align 4, !tbaa !5
  %51 = mul nuw i32 %11, 10752
  %52 = add nuw i32 %51, 43008
  %53 = add i32 %8, %52
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %1, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !5
  %57 = fmul contract float %56, %2
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %54
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !5
  %60 = fadd contract float %57, %59
  store float %60, float addrspace(1)* %58, align 4, !tbaa !5
  %61 = mul nuw i32 %11, 10752
  %62 = add nuw i32 %61, 53760
  %63 = add i32 %8, %62
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %1, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !5
  %67 = fmul contract float %66, %2
  %68 = getelementptr inbounds float, float addrspace(1)* %0, i64 %64
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !5
  %70 = fadd contract float %67, %69
  store float %70, float addrspace(1)* %68, align 4, !tbaa !5
  %71 = mul nuw i32 %11, 10752
  %72 = add nuw i32 %71, 64512
  %73 = add i32 %8, %72
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %1, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !5
  %77 = fmul contract float %76, %2
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %74
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !5
  %80 = fadd contract float %77, %79
  store float %80, float addrspace(1)* %78, align 4, !tbaa !5
  %81 = mul nuw i32 %11, 10752
  %82 = add nuw i32 %81, 75264
  %83 = add i32 %8, %82
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %1, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !5
  %87 = fmul contract float %86, %2
  %88 = getelementptr inbounds float, float addrspace(1)* %0, i64 %84
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !5
  %90 = fadd contract float %87, %89
  store float %90, float addrspace(1)* %88, align 4, !tbaa !5
  %91 = add nuw nsw i32 %11, 8
  %92 = icmp eq i32 %91, 2048
  br i1 %92, label %9, label %10, !llvm.loop !9
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
