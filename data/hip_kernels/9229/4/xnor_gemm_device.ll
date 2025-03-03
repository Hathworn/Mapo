; ModuleID = '../data/hip_kernels/9229/4/main.cu'
source_filename = "../data/hip_kernels/9229/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ9xnor_gemmPjS_PfiiiE2As = internal unnamed_addr addrspace(3) global [16 x [16 x i32]] undef, align 16
@_ZZ9xnor_gemmPjS_PfiiiE2Bs = internal unnamed_addr addrspace(3) global [16 x [16 x i32]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9xnor_gemmPjS_Pfiii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = shl nsw i32 %5, 4
  %12 = mul nsw i32 %11, %7
  %13 = shl nsw i32 %8, 4
  %14 = add nsw i32 %12, %13
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds float, float addrspace(1)* %2, i64 %15
  %17 = sdiv i32 %4, 16
  %18 = icmp sgt i32 %4, 15
  br i1 %18, label %19, label %66

19:                                               ; preds = %6
  %20 = mul i32 %7, %4
  %21 = mul nsw i32 %9, %4
  %22 = add nsw i32 %21, %10
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9xnor_gemmPjS_PfiiiE2As, i32 0, i32 %9, i32 %10
  %25 = mul nsw i32 %9, %5
  %26 = add nsw i32 %25, %10
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9xnor_gemmPjS_PfiiiE2Bs, i32 0, i32 %9, i32 %10
  %29 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9xnor_gemmPjS_PfiiiE2As, i32 0, i32 %9, i32 0
  %30 = getelementptr i32, i32 addrspace(1)* %0, i64 %23
  %31 = getelementptr i32, i32 addrspace(1)* %1, i64 %27
  %32 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9xnor_gemmPjS_PfiiiE2Bs, i32 0, i32 0, i32 %10
  %33 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9xnor_gemmPjS_PfiiiE2As, i32 0, i32 %9, i32 1
  %34 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9xnor_gemmPjS_PfiiiE2Bs, i32 0, i32 1, i32 %10
  %35 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9xnor_gemmPjS_PfiiiE2As, i32 0, i32 %9, i32 2
  %36 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9xnor_gemmPjS_PfiiiE2Bs, i32 0, i32 2, i32 %10
  %37 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9xnor_gemmPjS_PfiiiE2As, i32 0, i32 %9, i32 3
  %38 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9xnor_gemmPjS_PfiiiE2Bs, i32 0, i32 3, i32 %10
  %39 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9xnor_gemmPjS_PfiiiE2As, i32 0, i32 %9, i32 4
  %40 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9xnor_gemmPjS_PfiiiE2Bs, i32 0, i32 4, i32 %10
  %41 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9xnor_gemmPjS_PfiiiE2As, i32 0, i32 %9, i32 5
  %42 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9xnor_gemmPjS_PfiiiE2Bs, i32 0, i32 5, i32 %10
  %43 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9xnor_gemmPjS_PfiiiE2As, i32 0, i32 %9, i32 6
  %44 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9xnor_gemmPjS_PfiiiE2Bs, i32 0, i32 6, i32 %10
  %45 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9xnor_gemmPjS_PfiiiE2As, i32 0, i32 %9, i32 7
  %46 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9xnor_gemmPjS_PfiiiE2Bs, i32 0, i32 7, i32 %10
  %47 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9xnor_gemmPjS_PfiiiE2As, i32 0, i32 %9, i32 8
  %48 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9xnor_gemmPjS_PfiiiE2Bs, i32 0, i32 8, i32 %10
  %49 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9xnor_gemmPjS_PfiiiE2As, i32 0, i32 %9, i32 9
  %50 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9xnor_gemmPjS_PfiiiE2Bs, i32 0, i32 9, i32 %10
  %51 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9xnor_gemmPjS_PfiiiE2As, i32 0, i32 %9, i32 10
  %52 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9xnor_gemmPjS_PfiiiE2Bs, i32 0, i32 10, i32 %10
  %53 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9xnor_gemmPjS_PfiiiE2As, i32 0, i32 %9, i32 11
  %54 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9xnor_gemmPjS_PfiiiE2Bs, i32 0, i32 11, i32 %10
  %55 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9xnor_gemmPjS_PfiiiE2As, i32 0, i32 %9, i32 12
  %56 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9xnor_gemmPjS_PfiiiE2Bs, i32 0, i32 12, i32 %10
  %57 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9xnor_gemmPjS_PfiiiE2As, i32 0, i32 %9, i32 13
  %58 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9xnor_gemmPjS_PfiiiE2Bs, i32 0, i32 13, i32 %10
  %59 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9xnor_gemmPjS_PfiiiE2As, i32 0, i32 %9, i32 14
  %60 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9xnor_gemmPjS_PfiiiE2Bs, i32 0, i32 14, i32 %10
  %61 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9xnor_gemmPjS_PfiiiE2As, i32 0, i32 %9, i32 15
  %62 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ9xnor_gemmPjS_PfiiiE2Bs, i32 0, i32 15, i32 %10
  br label %70

63:                                               ; preds = %70
  %64 = uitofp i32 %162 to float
  %65 = fmul contract float %64, 2.000000e+00
  br label %66

66:                                               ; preds = %63, %6
  %67 = phi float [ 0.000000e+00, %6 ], [ %65, %63 ]
  %68 = add nsw i32 %13, %10
  %69 = icmp slt i32 %68, %5
  br i1 %69, label %165, label %178

70:                                               ; preds = %19, %70
  %71 = phi i32 [ 0, %19 ], [ %162, %70 ]
  %72 = phi i32 [ 0, %19 ], [ %163, %70 ]
  %73 = add i32 %72, %20
  %74 = shl i32 %73, 4
  %75 = sext i32 %74 to i64
  %76 = mul nsw i32 %72, %11
  %77 = add nsw i32 %76, %13
  %78 = sext i32 %77 to i64
  %79 = getelementptr i32, i32 addrspace(1)* %30, i64 %75
  %80 = load i32, i32 addrspace(1)* %79, align 4, !tbaa !5, !amdgpu.noclobber !9
  store i32 %80, i32 addrspace(3)* %24, align 4, !tbaa !5
  %81 = getelementptr i32, i32 addrspace(1)* %31, i64 %78
  %82 = load i32, i32 addrspace(1)* %81, align 4, !tbaa !5, !amdgpu.noclobber !9
  store i32 %82, i32 addrspace(3)* %28, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %83 = load i32, i32 addrspace(3)* %29, align 16, !tbaa !5
  %84 = load i32, i32 addrspace(3)* %32, align 4, !tbaa !5
  %85 = xor i32 %84, %83
  %86 = tail call i32 @llvm.ctpop.i32(i32 %85), !range !10
  %87 = add i32 %86, %71
  %88 = load i32, i32 addrspace(3)* %33, align 4, !tbaa !5
  %89 = load i32, i32 addrspace(3)* %34, align 4, !tbaa !5
  %90 = xor i32 %89, %88
  %91 = tail call i32 @llvm.ctpop.i32(i32 %90), !range !10
  %92 = add i32 %91, %87
  %93 = load i32, i32 addrspace(3)* %35, align 8, !tbaa !5
  %94 = load i32, i32 addrspace(3)* %36, align 4, !tbaa !5
  %95 = xor i32 %94, %93
  %96 = tail call i32 @llvm.ctpop.i32(i32 %95), !range !10
  %97 = add i32 %96, %92
  %98 = load i32, i32 addrspace(3)* %37, align 4, !tbaa !5
  %99 = load i32, i32 addrspace(3)* %38, align 4, !tbaa !5
  %100 = xor i32 %99, %98
  %101 = tail call i32 @llvm.ctpop.i32(i32 %100), !range !10
  %102 = add i32 %101, %97
  %103 = load i32, i32 addrspace(3)* %39, align 16, !tbaa !5
  %104 = load i32, i32 addrspace(3)* %40, align 4, !tbaa !5
  %105 = xor i32 %104, %103
  %106 = tail call i32 @llvm.ctpop.i32(i32 %105), !range !10
  %107 = add i32 %106, %102
  %108 = load i32, i32 addrspace(3)* %41, align 4, !tbaa !5
  %109 = load i32, i32 addrspace(3)* %42, align 4, !tbaa !5
  %110 = xor i32 %109, %108
  %111 = tail call i32 @llvm.ctpop.i32(i32 %110), !range !10
  %112 = add i32 %111, %107
  %113 = load i32, i32 addrspace(3)* %43, align 8, !tbaa !5
  %114 = load i32, i32 addrspace(3)* %44, align 4, !tbaa !5
  %115 = xor i32 %114, %113
  %116 = tail call i32 @llvm.ctpop.i32(i32 %115), !range !10
  %117 = add i32 %116, %112
  %118 = load i32, i32 addrspace(3)* %45, align 4, !tbaa !5
  %119 = load i32, i32 addrspace(3)* %46, align 4, !tbaa !5
  %120 = xor i32 %119, %118
  %121 = tail call i32 @llvm.ctpop.i32(i32 %120), !range !10
  %122 = add i32 %121, %117
  %123 = load i32, i32 addrspace(3)* %47, align 16, !tbaa !5
  %124 = load i32, i32 addrspace(3)* %48, align 4, !tbaa !5
  %125 = xor i32 %124, %123
  %126 = tail call i32 @llvm.ctpop.i32(i32 %125), !range !10
  %127 = add i32 %126, %122
  %128 = load i32, i32 addrspace(3)* %49, align 4, !tbaa !5
  %129 = load i32, i32 addrspace(3)* %50, align 4, !tbaa !5
  %130 = xor i32 %129, %128
  %131 = tail call i32 @llvm.ctpop.i32(i32 %130), !range !10
  %132 = add i32 %131, %127
  %133 = load i32, i32 addrspace(3)* %51, align 8, !tbaa !5
  %134 = load i32, i32 addrspace(3)* %52, align 4, !tbaa !5
  %135 = xor i32 %134, %133
  %136 = tail call i32 @llvm.ctpop.i32(i32 %135), !range !10
  %137 = add i32 %136, %132
  %138 = load i32, i32 addrspace(3)* %53, align 4, !tbaa !5
  %139 = load i32, i32 addrspace(3)* %54, align 4, !tbaa !5
  %140 = xor i32 %139, %138
  %141 = tail call i32 @llvm.ctpop.i32(i32 %140), !range !10
  %142 = add i32 %141, %137
  %143 = load i32, i32 addrspace(3)* %55, align 16, !tbaa !5
  %144 = load i32, i32 addrspace(3)* %56, align 4, !tbaa !5
  %145 = xor i32 %144, %143
  %146 = tail call i32 @llvm.ctpop.i32(i32 %145), !range !10
  %147 = add i32 %146, %142
  %148 = load i32, i32 addrspace(3)* %57, align 4, !tbaa !5
  %149 = load i32, i32 addrspace(3)* %58, align 4, !tbaa !5
  %150 = xor i32 %149, %148
  %151 = tail call i32 @llvm.ctpop.i32(i32 %150), !range !10
  %152 = add i32 %151, %147
  %153 = load i32, i32 addrspace(3)* %59, align 8, !tbaa !5
  %154 = load i32, i32 addrspace(3)* %60, align 4, !tbaa !5
  %155 = xor i32 %154, %153
  %156 = tail call i32 @llvm.ctpop.i32(i32 %155), !range !10
  %157 = add i32 %156, %152
  %158 = load i32, i32 addrspace(3)* %61, align 4, !tbaa !5
  %159 = load i32, i32 addrspace(3)* %62, align 4, !tbaa !5
  %160 = xor i32 %159, %158
  %161 = tail call i32 @llvm.ctpop.i32(i32 %160), !range !10
  %162 = add i32 %161, %157
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %163 = add nuw nsw i32 %72, 1
  %164 = icmp eq i32 %163, %17
  br i1 %164, label %63, label %70, !llvm.loop !11

165:                                              ; preds = %66
  %166 = shl nsw i32 %7, 4
  %167 = add nsw i32 %166, %9
  %168 = icmp slt i32 %167, %3
  br i1 %168, label %169, label %178

169:                                              ; preds = %165
  %170 = shl nsw i32 %4, 5
  %171 = sitofp i32 %170 to float
  %172 = fsub contract float %67, %171
  %173 = fneg contract float %172
  %174 = mul nsw i32 %9, %5
  %175 = add nsw i32 %174, %10
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds float, float addrspace(1)* %16, i64 %176
  store float %173, float addrspace(1)* %177, align 4, !tbaa !13
  br label %178

178:                                              ; preds = %169, %165, %66
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!10 = !{i32 0, i32 33}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!14, !14, i64 0}
!14 = !{!"float", !7, i64 0}
