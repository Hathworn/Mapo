; ModuleID = '../data/hip_kernels/9068/4/main.cu'
source_filename = "../data/hip_kernels/9068/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21squareMatrixMulKernelPiS_S_i(i32 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = icmp sgt i32 %3, 0
  %6 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %7 = mul i32 %6, %3
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  br i1 %5, label %9, label %42

9:                                                ; preds = %4
  %10 = and i32 %3, 7
  %11 = icmp ult i32 %3, 8
  br i1 %11, label %14, label %12

12:                                               ; preds = %9
  %13 = and i32 %3, -8
  br label %47

14:                                               ; preds = %47, %9
  %15 = phi float [ undef, %9 ], [ %161, %47 ]
  %16 = phi float [ 0.000000e+00, %9 ], [ %161, %47 ]
  %17 = phi i32 [ 0, %9 ], [ %162, %47 ]
  %18 = icmp eq i32 %10, 0
  br i1 %18, label %39, label %19

19:                                               ; preds = %14, %19
  %20 = phi float [ %35, %19 ], [ %16, %14 ]
  %21 = phi i32 [ %36, %19 ], [ %17, %14 ]
  %22 = phi i32 [ %37, %19 ], [ 0, %14 ]
  %23 = add i32 %21, %7
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %24
  %26 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !5, !amdgpu.noclobber !9
  %27 = sitofp i32 %26 to float
  %28 = mul nsw i32 %21, %3
  %29 = add i32 %28, %8
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %30
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !5, !amdgpu.noclobber !9
  %33 = sitofp i32 %32 to float
  %34 = fmul contract float %27, %33
  %35 = fadd contract float %20, %34
  %36 = add nuw nsw i32 %21, 1
  %37 = add i32 %22, 1
  %38 = icmp eq i32 %37, %10
  br i1 %38, label %39, label %19, !llvm.loop !10

39:                                               ; preds = %19, %14
  %40 = phi float [ %15, %14 ], [ %35, %19 ]
  %41 = fptosi float %40 to i32
  br label %42

42:                                               ; preds = %4, %39
  %43 = phi i32 [ %41, %39 ], [ 0, %4 ]
  %44 = add i32 %7, %8
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %45
  store i32 %43, i32 addrspace(1)* %46, align 4, !tbaa !5
  ret void

47:                                               ; preds = %47, %12
  %48 = phi float [ 0.000000e+00, %12 ], [ %161, %47 ]
  %49 = phi i32 [ 0, %12 ], [ %162, %47 ]
  %50 = phi i32 [ 0, %12 ], [ %163, %47 ]
  %51 = add i32 %49, %7
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %52
  %54 = load i32, i32 addrspace(1)* %53, align 4, !tbaa !5, !amdgpu.noclobber !9
  %55 = sitofp i32 %54 to float
  %56 = mul nsw i32 %49, %3
  %57 = add i32 %56, %8
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %58
  %60 = load i32, i32 addrspace(1)* %59, align 4, !tbaa !5, !amdgpu.noclobber !9
  %61 = sitofp i32 %60 to float
  %62 = fmul contract float %55, %61
  %63 = fadd contract float %48, %62
  %64 = or i32 %49, 1
  %65 = add i32 %64, %7
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %66
  %68 = load i32, i32 addrspace(1)* %67, align 4, !tbaa !5, !amdgpu.noclobber !9
  %69 = sitofp i32 %68 to float
  %70 = mul nsw i32 %64, %3
  %71 = add i32 %70, %8
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %72
  %74 = load i32, i32 addrspace(1)* %73, align 4, !tbaa !5, !amdgpu.noclobber !9
  %75 = sitofp i32 %74 to float
  %76 = fmul contract float %69, %75
  %77 = fadd contract float %63, %76
  %78 = or i32 %49, 2
  %79 = add i32 %78, %7
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %80
  %82 = load i32, i32 addrspace(1)* %81, align 4, !tbaa !5, !amdgpu.noclobber !9
  %83 = sitofp i32 %82 to float
  %84 = mul nsw i32 %78, %3
  %85 = add i32 %84, %8
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %86
  %88 = load i32, i32 addrspace(1)* %87, align 4, !tbaa !5, !amdgpu.noclobber !9
  %89 = sitofp i32 %88 to float
  %90 = fmul contract float %83, %89
  %91 = fadd contract float %77, %90
  %92 = or i32 %49, 3
  %93 = add i32 %92, %7
  %94 = zext i32 %93 to i64
  %95 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %94
  %96 = load i32, i32 addrspace(1)* %95, align 4, !tbaa !5, !amdgpu.noclobber !9
  %97 = sitofp i32 %96 to float
  %98 = mul nsw i32 %92, %3
  %99 = add i32 %98, %8
  %100 = zext i32 %99 to i64
  %101 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %100
  %102 = load i32, i32 addrspace(1)* %101, align 4, !tbaa !5, !amdgpu.noclobber !9
  %103 = sitofp i32 %102 to float
  %104 = fmul contract float %97, %103
  %105 = fadd contract float %91, %104
  %106 = or i32 %49, 4
  %107 = add i32 %106, %7
  %108 = zext i32 %107 to i64
  %109 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %108
  %110 = load i32, i32 addrspace(1)* %109, align 4, !tbaa !5, !amdgpu.noclobber !9
  %111 = sitofp i32 %110 to float
  %112 = mul nsw i32 %106, %3
  %113 = add i32 %112, %8
  %114 = zext i32 %113 to i64
  %115 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %114
  %116 = load i32, i32 addrspace(1)* %115, align 4, !tbaa !5, !amdgpu.noclobber !9
  %117 = sitofp i32 %116 to float
  %118 = fmul contract float %111, %117
  %119 = fadd contract float %105, %118
  %120 = or i32 %49, 5
  %121 = add i32 %120, %7
  %122 = zext i32 %121 to i64
  %123 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %122
  %124 = load i32, i32 addrspace(1)* %123, align 4, !tbaa !5, !amdgpu.noclobber !9
  %125 = sitofp i32 %124 to float
  %126 = mul nsw i32 %120, %3
  %127 = add i32 %126, %8
  %128 = zext i32 %127 to i64
  %129 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %128
  %130 = load i32, i32 addrspace(1)* %129, align 4, !tbaa !5, !amdgpu.noclobber !9
  %131 = sitofp i32 %130 to float
  %132 = fmul contract float %125, %131
  %133 = fadd contract float %119, %132
  %134 = or i32 %49, 6
  %135 = add i32 %134, %7
  %136 = zext i32 %135 to i64
  %137 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %136
  %138 = load i32, i32 addrspace(1)* %137, align 4, !tbaa !5, !amdgpu.noclobber !9
  %139 = sitofp i32 %138 to float
  %140 = mul nsw i32 %134, %3
  %141 = add i32 %140, %8
  %142 = zext i32 %141 to i64
  %143 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %142
  %144 = load i32, i32 addrspace(1)* %143, align 4, !tbaa !5, !amdgpu.noclobber !9
  %145 = sitofp i32 %144 to float
  %146 = fmul contract float %139, %145
  %147 = fadd contract float %133, %146
  %148 = or i32 %49, 7
  %149 = add i32 %148, %7
  %150 = zext i32 %149 to i64
  %151 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %150
  %152 = load i32, i32 addrspace(1)* %151, align 4, !tbaa !5, !amdgpu.noclobber !9
  %153 = sitofp i32 %152 to float
  %154 = mul nsw i32 %148, %3
  %155 = add i32 %154, %8
  %156 = zext i32 %155 to i64
  %157 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %156
  %158 = load i32, i32 addrspace(1)* %157, align 4, !tbaa !5, !amdgpu.noclobber !9
  %159 = sitofp i32 %158 to float
  %160 = fmul contract float %153, %159
  %161 = fadd contract float %147, %160
  %162 = add nuw nsw i32 %49, 8
  %163 = add i32 %50, 8
  %164 = icmp eq i32 %163, %13
  br i1 %164, label %14, label %47, !llvm.loop !12
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

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
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
