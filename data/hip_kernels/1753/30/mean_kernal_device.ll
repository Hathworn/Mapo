; ModuleID = '../data/hip_kernels/1753/30/main.cu'
source_filename = "../data/hip_kernels/1753/30/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11mean_kernalPKfPfiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = mul i32 %8, %4
  %10 = add i32 %9, %7
  %11 = add i32 %10, %5
  %12 = freeze i32 %11
  %13 = icmp sgt i32 %2, 0
  br i1 %13, label %14, label %40

14:                                               ; preds = %6
  %15 = srem i32 %12, %2
  %16 = sub nsw i32 %12, %15
  %17 = and i32 %2, 7
  %18 = icmp ult i32 %2, 8
  br i1 %18, label %21, label %19

19:                                               ; preds = %14
  %20 = and i32 %2, -8
  br label %46

21:                                               ; preds = %46, %14
  %22 = phi float [ undef, %14 ], [ %112, %46 ]
  %23 = phi float [ 0.000000e+00, %14 ], [ %112, %46 ]
  %24 = phi i32 [ 0, %14 ], [ %113, %46 ]
  %25 = icmp eq i32 %17, 0
  br i1 %25, label %40, label %26

26:                                               ; preds = %21, %26
  %27 = phi float [ %36, %26 ], [ %23, %21 ]
  %28 = phi i32 [ %37, %26 ], [ %24, %21 ]
  %29 = phi i32 [ %38, %26 ], [ 0, %21 ]
  %30 = add i32 %16, %28
  %31 = mul i32 %30, %2
  %32 = add i32 %31, %15
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %0, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !5, !amdgpu.noclobber !9
  %36 = fadd contract float %27, %35
  %37 = add nuw nsw i32 %28, 1
  %38 = add i32 %29, 1
  %39 = icmp eq i32 %38, %17
  br i1 %39, label %40, label %26, !llvm.loop !10

40:                                               ; preds = %21, %26, %6
  %41 = phi float [ 0.000000e+00, %6 ], [ %22, %21 ], [ %36, %26 ]
  %42 = sitofp i32 %2 to float
  %43 = fdiv contract float %41, %42
  %44 = sext i32 %12 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %1, i64 %44
  store float %43, float addrspace(1)* %45, align 4, !tbaa !5
  ret void

46:                                               ; preds = %46, %19
  %47 = phi float [ 0.000000e+00, %19 ], [ %112, %46 ]
  %48 = phi i32 [ 0, %19 ], [ %113, %46 ]
  %49 = phi i32 [ 0, %19 ], [ %114, %46 ]
  %50 = add i32 %16, %48
  %51 = mul i32 %50, %2
  %52 = add i32 %51, %15
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %0, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !5, !amdgpu.noclobber !9
  %56 = fadd contract float %47, %55
  %57 = or i32 %48, 1
  %58 = add i32 %16, %57
  %59 = mul i32 %58, %2
  %60 = add i32 %59, %15
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !5, !amdgpu.noclobber !9
  %64 = fadd contract float %56, %63
  %65 = or i32 %48, 2
  %66 = add i32 %16, %65
  %67 = mul i32 %66, %2
  %68 = add i32 %67, %15
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %0, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !5, !amdgpu.noclobber !9
  %72 = fadd contract float %64, %71
  %73 = or i32 %48, 3
  %74 = add i32 %16, %73
  %75 = mul i32 %74, %2
  %76 = add i32 %75, %15
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !5, !amdgpu.noclobber !9
  %80 = fadd contract float %72, %79
  %81 = or i32 %48, 4
  %82 = add i32 %16, %81
  %83 = mul i32 %82, %2
  %84 = add i32 %83, %15
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %0, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !5, !amdgpu.noclobber !9
  %88 = fadd contract float %80, %87
  %89 = or i32 %48, 5
  %90 = add i32 %16, %89
  %91 = mul i32 %90, %2
  %92 = add i32 %91, %15
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %0, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !5, !amdgpu.noclobber !9
  %96 = fadd contract float %88, %95
  %97 = or i32 %48, 6
  %98 = add i32 %16, %97
  %99 = mul i32 %98, %2
  %100 = add i32 %99, %15
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %0, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !5, !amdgpu.noclobber !9
  %104 = fadd contract float %96, %103
  %105 = or i32 %48, 7
  %106 = add i32 %16, %105
  %107 = mul i32 %106, %2
  %108 = add i32 %107, %15
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %0, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !5, !amdgpu.noclobber !9
  %112 = fadd contract float %104, %111
  %113 = add nuw nsw i32 %48, 8
  %114 = add i32 %49, 8
  %115 = icmp eq i32 %114, %20
  br i1 %115, label %21, label %46, !llvm.loop !12
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
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
