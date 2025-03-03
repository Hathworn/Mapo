; ModuleID = '../data/hip_kernels/11972/2/main.cu'
source_filename = "../data/hip_kernels/11972/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @limitCoeff(i32 %0, i32 %1, i32 %2, float %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, %0
  br i1 %17, label %18, label %173

18:                                               ; preds = %7
  %19 = mul i32 %2, %1
  %20 = mul i32 %19, %16
  %21 = shl nsw i32 %20, 1
  %22 = shl nsw i32 %16, 1
  %23 = add nuw nsw i32 %22, 1
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %6, i64 %24
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !5
  %27 = fcmp contract ogt float %26, %3
  %28 = fneg contract float %3
  %29 = fcmp contract olt float %26, %28
  %30 = or i1 %27, %29
  br i1 %30, label %31, label %173

31:                                               ; preds = %18
  %32 = or i1 %27, %29
  %33 = select i1 %27, float %3, float %28
  br i1 %32, label %34, label %35

34:                                               ; preds = %31
  store float %33, float addrspace(1)* %25, align 4, !tbaa !7
  br label %35

35:                                               ; preds = %31, %34
  %36 = phi float [ %33, %34 ], [ %26, %31 ]
  %37 = icmp sgt i32 %19, 0
  br i1 %37, label %38, label %69

38:                                               ; preds = %35
  %39 = add nsw i32 %21, %19
  %40 = and i32 %19, 7
  %41 = icmp ult i32 %19, 8
  br i1 %41, label %44, label %42

42:                                               ; preds = %38
  %43 = and i32 %19, -8
  br label %78

44:                                               ; preds = %78, %38
  %45 = phi float [ undef, %38 ], [ %164, %78 ]
  %46 = phi float [ undef, %38 ], [ %169, %78 ]
  %47 = phi i32 [ 0, %38 ], [ %170, %78 ]
  %48 = phi float [ 0.000000e+00, %38 ], [ %169, %78 ]
  %49 = phi float [ 0.000000e+00, %38 ], [ %164, %78 ]
  %50 = icmp eq i32 %40, 0
  br i1 %50, label %69, label %51

51:                                               ; preds = %44, %51
  %52 = phi i32 [ %66, %51 ], [ %47, %44 ]
  %53 = phi float [ %65, %51 ], [ %48, %44 ]
  %54 = phi float [ %60, %51 ], [ %49, %44 ]
  %55 = phi i32 [ %67, %51 ], [ 0, %44 ]
  %56 = add nsw i32 %39, %52
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %4, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7
  %60 = fadd contract float %54, %59
  %61 = add nsw i32 %52, %20
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %5, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7
  %65 = fadd contract float %53, %64
  %66 = add nuw nsw i32 %52, 1
  %67 = add i32 %55, 1
  %68 = icmp eq i32 %67, %40
  br i1 %68, label %69, label %51, !llvm.loop !11

69:                                               ; preds = %44, %51, %35
  %70 = phi float [ 0.000000e+00, %35 ], [ %45, %44 ], [ %60, %51 ]
  %71 = phi float [ 0.000000e+00, %35 ], [ %46, %44 ], [ %65, %51 ]
  %72 = fmul contract float %70, %36
  %73 = fsub contract float %71, %72
  %74 = sitofp i32 %19 to float
  %75 = fdiv contract float %73, %74
  %76 = sext i32 %22 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %6, i64 %76
  store float %75, float addrspace(1)* %77, align 4, !tbaa !7
  br label %173

78:                                               ; preds = %78, %42
  %79 = phi i32 [ 0, %42 ], [ %170, %78 ]
  %80 = phi float [ 0.000000e+00, %42 ], [ %169, %78 ]
  %81 = phi float [ 0.000000e+00, %42 ], [ %164, %78 ]
  %82 = phi i32 [ 0, %42 ], [ %171, %78 ]
  %83 = add nsw i32 %39, %79
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %4, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7
  %87 = fadd contract float %81, %86
  %88 = add nsw i32 %79, %20
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %5, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !7
  %92 = fadd contract float %80, %91
  %93 = or i32 %79, 1
  %94 = add nsw i32 %39, %93
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %4, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !7
  %98 = fadd contract float %87, %97
  %99 = add nsw i32 %93, %20
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %5, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !7
  %103 = fadd contract float %92, %102
  %104 = or i32 %79, 2
  %105 = add nsw i32 %39, %104
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %4, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !7
  %109 = fadd contract float %98, %108
  %110 = add nsw i32 %104, %20
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %5, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !7
  %114 = fadd contract float %103, %113
  %115 = or i32 %79, 3
  %116 = add nsw i32 %39, %115
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %4, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !7
  %120 = fadd contract float %109, %119
  %121 = add nsw i32 %115, %20
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %5, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !7
  %125 = fadd contract float %114, %124
  %126 = or i32 %79, 4
  %127 = add nsw i32 %39, %126
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %4, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !7
  %131 = fadd contract float %120, %130
  %132 = add nsw i32 %126, %20
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %5, i64 %133
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !7
  %136 = fadd contract float %125, %135
  %137 = or i32 %79, 5
  %138 = add nsw i32 %39, %137
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %4, i64 %139
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !7
  %142 = fadd contract float %131, %141
  %143 = add nsw i32 %137, %20
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %5, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !7
  %147 = fadd contract float %136, %146
  %148 = or i32 %79, 6
  %149 = add nsw i32 %39, %148
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds float, float addrspace(1)* %4, i64 %150
  %152 = load float, float addrspace(1)* %151, align 4, !tbaa !7
  %153 = fadd contract float %142, %152
  %154 = add nsw i32 %148, %20
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds float, float addrspace(1)* %5, i64 %155
  %157 = load float, float addrspace(1)* %156, align 4, !tbaa !7
  %158 = fadd contract float %147, %157
  %159 = or i32 %79, 7
  %160 = add nsw i32 %39, %159
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds float, float addrspace(1)* %4, i64 %161
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !7
  %164 = fadd contract float %153, %163
  %165 = add nsw i32 %159, %20
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds float, float addrspace(1)* %5, i64 %166
  %168 = load float, float addrspace(1)* %167, align 4, !tbaa !7
  %169 = fadd contract float %158, %168
  %170 = add nuw nsw i32 %79, 8
  %171 = add i32 %82, 8
  %172 = icmp eq i32 %171, %43
  br i1 %172, label %44, label %78, !llvm.loop !13

173:                                              ; preds = %69, %18, %7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
