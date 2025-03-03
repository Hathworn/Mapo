; ModuleID = '../data/hip_kernels/16557/1/main.cu'
source_filename = "../data/hip_kernels/16557/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17calcCDFnormalizedPKjPfmm(i32 addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i64 %2, i64 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = zext i32 %5 to i64
  %7 = getelementptr inbounds float, float addrspace(1)* %1, i64 %6
  %8 = load float, float addrspace(1)* %7, align 4, !tbaa !5
  %9 = add nuw nsw i32 %5, 1
  %10 = and i32 %9, 7
  %11 = icmp ult i32 %5, 7
  br i1 %11, label %14, label %12

12:                                               ; preds = %4
  %13 = and i32 %9, -8
  br label %37

14:                                               ; preds = %37, %4
  %15 = phi float [ undef, %4 ], [ %87, %37 ]
  %16 = phi i32 [ 0, %4 ], [ %88, %37 ]
  %17 = phi float [ %8, %4 ], [ %87, %37 ]
  %18 = icmp eq i32 %10, 0
  br i1 %18, label %31, label %19

19:                                               ; preds = %14, %19
  %20 = phi i32 [ %28, %19 ], [ %16, %14 ]
  %21 = phi float [ %27, %19 ], [ %17, %14 ]
  %22 = phi i32 [ %29, %19 ], [ 0, %14 ]
  %23 = zext i32 %20 to i64
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %23
  %25 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !9, !amdgpu.noclobber !11
  %26 = uitofp i32 %25 to float
  %27 = fadd contract float %21, %26
  %28 = add nuw nsw i32 %20, 1
  %29 = add i32 %22, 1
  %30 = icmp eq i32 %29, %10
  br i1 %30, label %31, label %19, !llvm.loop !12

31:                                               ; preds = %19, %14
  %32 = phi float [ %15, %14 ], [ %27, %19 ]
  %33 = mul i64 %3, %2
  %34 = uitofp i64 %33 to float
  %35 = fdiv contract float 1.000000e+00, %34
  %36 = fmul contract float %35, %32
  store float %36, float addrspace(1)* %7, align 4, !tbaa !5
  ret void

37:                                               ; preds = %37, %12
  %38 = phi i32 [ 0, %12 ], [ %88, %37 ]
  %39 = phi float [ %8, %12 ], [ %87, %37 ]
  %40 = phi i32 [ 0, %12 ], [ %89, %37 ]
  %41 = zext i32 %38 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %41
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !9, !amdgpu.noclobber !11
  %44 = uitofp i32 %43 to float
  %45 = fadd contract float %39, %44
  %46 = or i32 %38, 1
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %47
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !9, !amdgpu.noclobber !11
  %50 = uitofp i32 %49 to float
  %51 = fadd contract float %45, %50
  %52 = or i32 %38, 2
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %53
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !9, !amdgpu.noclobber !11
  %56 = uitofp i32 %55 to float
  %57 = fadd contract float %51, %56
  %58 = or i32 %38, 3
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %59
  %61 = load i32, i32 addrspace(1)* %60, align 4, !tbaa !9, !amdgpu.noclobber !11
  %62 = uitofp i32 %61 to float
  %63 = fadd contract float %57, %62
  %64 = or i32 %38, 4
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %65
  %67 = load i32, i32 addrspace(1)* %66, align 4, !tbaa !9, !amdgpu.noclobber !11
  %68 = uitofp i32 %67 to float
  %69 = fadd contract float %63, %68
  %70 = or i32 %38, 5
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %71
  %73 = load i32, i32 addrspace(1)* %72, align 4, !tbaa !9, !amdgpu.noclobber !11
  %74 = uitofp i32 %73 to float
  %75 = fadd contract float %69, %74
  %76 = or i32 %38, 6
  %77 = zext i32 %76 to i64
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %77
  %79 = load i32, i32 addrspace(1)* %78, align 4, !tbaa !9, !amdgpu.noclobber !11
  %80 = uitofp i32 %79 to float
  %81 = fadd contract float %75, %80
  %82 = or i32 %38, 7
  %83 = zext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %83
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !9, !amdgpu.noclobber !11
  %86 = uitofp i32 %85 to float
  %87 = fadd contract float %81, %86
  %88 = add nuw nsw i32 %38, 8
  %89 = add i32 %40, 8
  %90 = icmp eq i32 %89, %13
  br i1 %90, label %14, label %37, !llvm.loop !14
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !7, i64 0}
!11 = !{}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
