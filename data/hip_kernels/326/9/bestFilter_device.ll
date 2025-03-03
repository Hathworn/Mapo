; ModuleID = '../data/hip_kernels/326/9/main.cu'
source_filename = "../data/hip_kernels/326/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10bestFilterPKdPKfS2_S2_S2_PfS3_Pi(double addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture writeonly %5, float addrspace(1)* nocapture writeonly %6, i32 addrspace(1)* nocapture writeonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = load double, double addrspace(1)* %0, align 8, !tbaa !5, !amdgpu.noclobber !9
  %12 = fptosi double %11 to i32
  %13 = getelementptr inbounds double, double addrspace(1)* %0, i64 1
  %14 = load double, double addrspace(1)* %13, align 8, !tbaa !5, !amdgpu.noclobber !9
  %15 = fptosi double %14 to i32
  %16 = getelementptr inbounds double, double addrspace(1)* %0, i64 2
  %17 = load double, double addrspace(1)* %16, align 8, !tbaa !5, !amdgpu.noclobber !9
  %18 = fptrunc double %17 to float
  %19 = getelementptr inbounds double, double addrspace(1)* %0, i64 8
  %20 = load double, double addrspace(1)* %19, align 8, !tbaa !5, !amdgpu.noclobber !9
  %21 = fptrunc double %20 to float
  %22 = shl nsw i32 %10, 10
  %23 = or i32 %22, %9
  %24 = add nsw i32 %12, -1
  %25 = icmp slt i32 %23, %24
  %26 = icmp sgt i32 %23, 0
  %27 = and i1 %26, %25
  br i1 %27, label %28, label %88

28:                                               ; preds = %8
  %29 = icmp sgt i32 %15, 0
  br i1 %29, label %30, label %77

30:                                               ; preds = %28
  %31 = add nuw nsw i32 %23, 1
  %32 = add nsw i32 %23, -1
  br label %33

33:                                               ; preds = %30, %33
  %34 = phi i32 [ 0, %30 ], [ %75, %33 ]
  %35 = phi i32 [ 0, %30 ], [ %74, %33 ]
  %36 = phi float [ 0.000000e+00, %30 ], [ %73, %33 ]
  %37 = phi float [ undef, %30 ], [ %72, %33 ]
  %38 = mul nsw i32 %34, %12
  %39 = add nsw i32 %38, %23
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %1, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !10, !amdgpu.noclobber !9
  %43 = zext i32 %34 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %2, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !10, !amdgpu.noclobber !9
  %46 = getelementptr inbounds float, float addrspace(1)* %3, i64 %43
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !10, !amdgpu.noclobber !9
  %48 = fmul contract float %45, %47
  %49 = fadd contract float %42, %48
  %50 = fmul contract float %49, %49
  %51 = fadd contract float %47, 1.000000e+00
  %52 = fdiv contract float %50, %51
  %53 = fmul contract float %45, %48
  %54 = fsub contract float %52, %53
  %55 = add nsw i32 %31, %38
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %1, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !10, !amdgpu.noclobber !9
  %59 = add nsw i32 %32, %38
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %1, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !10, !amdgpu.noclobber !9
  %63 = fsub contract float %58, %62
  %64 = fmul contract float %63, %63
  %65 = getelementptr inbounds float, float addrspace(1)* %4, i64 %43
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !10, !amdgpu.noclobber !9
  %67 = fadd contract float %66, %21
  %68 = fdiv contract float %64, %67
  %69 = fadd contract float %54, %68
  %70 = fcmp contract ogt float %69, %36
  %71 = fsub contract float %49, %48
  %72 = select i1 %70, float %71, float %37
  %73 = select i1 %70, float %69, float %36
  %74 = select i1 %70, i32 %34, i32 %35
  %75 = add nuw nsw i32 %34, 1
  %76 = icmp eq i32 %75, %15
  br i1 %76, label %77, label %33, !llvm.loop !12

77:                                               ; preds = %33, %28
  %78 = phi float [ undef, %28 ], [ %72, %33 ]
  %79 = phi float [ 0.000000e+00, %28 ], [ %73, %33 ]
  %80 = phi i32 [ 0, %28 ], [ %74, %33 ]
  %81 = fmul contract float %18, %18
  %82 = fcmp contract ogt float %79, %81
  br i1 %82, label %83, label %88

83:                                               ; preds = %77
  %84 = sext i32 %23 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %6, i64 %84
  store float %79, float addrspace(1)* %85, align 4, !tbaa !10
  %86 = getelementptr inbounds float, float addrspace(1)* %5, i64 %84
  store float %78, float addrspace(1)* %86, align 4, !tbaa !10
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %84
  store i32 %80, i32 addrspace(1)* %87, align 4, !tbaa !14
  br label %88

88:                                               ; preds = %77, %83, %8
  ret void
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
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !7, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = !{!15, !15, i64 0}
!15 = !{!"int", !7, i64 0}
