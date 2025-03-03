; ModuleID = '../data/hip_kernels/3328/6/main.cu'
source_filename = "../data/hip_kernels/3328/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ14MatrixMultiplyPKfS0_PfiiiE2As = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16
@_ZZ14MatrixMultiplyPKfS0_PfiiiE2Bs = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14MatrixMultiplyPKfS0_Pfiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 2, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 16
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 8, !tbaa !6
  %16 = mul i32 %7, %12
  %17 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %18 = add i32 %16, %17
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !4, !invariant.load !5
  %23 = zext i16 %22 to i32
  %24 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %25 = bitcast i8 addrspace(4)* %24 to i32 addrspace(4)*
  %26 = load i32, i32 addrspace(4)* %25, align 4, !tbaa !16
  %27 = mul i32 %19, %23
  %28 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %29 = add i32 %27, %28
  %30 = udiv i32 %26, %23
  %31 = mul i32 %30, %23
  %32 = icmp ugt i32 %26, %31
  %33 = zext i1 %32 to i32
  %34 = add i32 %30, %33
  %35 = mul i32 %34, %23
  %36 = udiv i32 %15, %12
  %37 = mul i32 %36, %12
  %38 = icmp ugt i32 %15, %37
  %39 = zext i1 %38 to i32
  %40 = add i32 %36, %39
  %41 = mul i32 %40, %12
  %42 = add nsw i32 %4, -1
  %43 = add i32 %42, %41
  %44 = sdiv i32 %43, %41
  %45 = icmp sgt i32 %44, 0
  br i1 %45, label %46, label %97

46:                                               ; preds = %6
  %47 = add nsw i32 %3, -1
  %48 = add i32 %47, %35
  %49 = sdiv i32 %48, %35
  %50 = icmp sgt i32 %49, 0
  %51 = add nsw i32 %3, 15
  %52 = sdiv i32 %51, 16
  %53 = icmp sgt i32 %3, 0
  %54 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14MatrixMultiplyPKfS0_PfiiiE2As, i32 0, i32 %17, i32 %28
  %55 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14MatrixMultiplyPKfS0_PfiiiE2Bs, i32 0, i32 %17, i32 %28
  %56 = tail call i32 @llvm.smax.i32(i32 %52, i32 1)
  %57 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14MatrixMultiplyPKfS0_PfiiiE2As, i32 0, i32 %17, i32 0
  %58 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14MatrixMultiplyPKfS0_PfiiiE2Bs, i32 0, i32 0, i32 %28
  %59 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14MatrixMultiplyPKfS0_PfiiiE2As, i32 0, i32 %17, i32 1
  %60 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14MatrixMultiplyPKfS0_PfiiiE2Bs, i32 0, i32 1, i32 %28
  %61 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14MatrixMultiplyPKfS0_PfiiiE2As, i32 0, i32 %17, i32 2
  %62 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14MatrixMultiplyPKfS0_PfiiiE2Bs, i32 0, i32 2, i32 %28
  %63 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14MatrixMultiplyPKfS0_PfiiiE2As, i32 0, i32 %17, i32 3
  %64 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14MatrixMultiplyPKfS0_PfiiiE2Bs, i32 0, i32 3, i32 %28
  %65 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14MatrixMultiplyPKfS0_PfiiiE2As, i32 0, i32 %17, i32 4
  %66 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14MatrixMultiplyPKfS0_PfiiiE2Bs, i32 0, i32 4, i32 %28
  %67 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14MatrixMultiplyPKfS0_PfiiiE2As, i32 0, i32 %17, i32 5
  %68 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14MatrixMultiplyPKfS0_PfiiiE2Bs, i32 0, i32 5, i32 %28
  %69 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14MatrixMultiplyPKfS0_PfiiiE2As, i32 0, i32 %17, i32 6
  %70 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14MatrixMultiplyPKfS0_PfiiiE2Bs, i32 0, i32 6, i32 %28
  %71 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14MatrixMultiplyPKfS0_PfiiiE2As, i32 0, i32 %17, i32 7
  %72 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14MatrixMultiplyPKfS0_PfiiiE2Bs, i32 0, i32 7, i32 %28
  %73 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14MatrixMultiplyPKfS0_PfiiiE2As, i32 0, i32 %17, i32 8
  %74 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14MatrixMultiplyPKfS0_PfiiiE2Bs, i32 0, i32 8, i32 %28
  %75 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14MatrixMultiplyPKfS0_PfiiiE2As, i32 0, i32 %17, i32 9
  %76 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14MatrixMultiplyPKfS0_PfiiiE2Bs, i32 0, i32 9, i32 %28
  %77 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14MatrixMultiplyPKfS0_PfiiiE2As, i32 0, i32 %17, i32 10
  %78 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14MatrixMultiplyPKfS0_PfiiiE2Bs, i32 0, i32 10, i32 %28
  %79 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14MatrixMultiplyPKfS0_PfiiiE2As, i32 0, i32 %17, i32 11
  %80 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14MatrixMultiplyPKfS0_PfiiiE2Bs, i32 0, i32 11, i32 %28
  %81 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14MatrixMultiplyPKfS0_PfiiiE2As, i32 0, i32 %17, i32 12
  %82 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14MatrixMultiplyPKfS0_PfiiiE2Bs, i32 0, i32 12, i32 %28
  %83 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14MatrixMultiplyPKfS0_PfiiiE2As, i32 0, i32 %17, i32 13
  %84 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14MatrixMultiplyPKfS0_PfiiiE2Bs, i32 0, i32 13, i32 %28
  %85 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14MatrixMultiplyPKfS0_PfiiiE2As, i32 0, i32 %17, i32 14
  %86 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14MatrixMultiplyPKfS0_PfiiiE2Bs, i32 0, i32 14, i32 %28
  %87 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14MatrixMultiplyPKfS0_PfiiiE2As, i32 0, i32 %17, i32 15
  %88 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ14MatrixMultiplyPKfS0_PfiiiE2Bs, i32 0, i32 15, i32 %28
  br label %89

89:                                               ; preds = %46, %98
  %90 = phi i32 [ 0, %46 ], [ %99, %98 ]
  br i1 %50, label %91, label %98

91:                                               ; preds = %89
  %92 = mul nsw i32 %90, %41
  %93 = add nsw i32 %18, %92
  %94 = icmp slt i32 %93, %4
  %95 = mul nsw i32 %93, %3
  %96 = mul nsw i32 %93, %5
  br label %101

97:                                               ; preds = %98, %6
  ret void

98:                                               ; preds = %206, %89
  %99 = add nuw nsw i32 %90, 1
  %100 = icmp eq i32 %99, %44
  br i1 %100, label %97, label %89, !llvm.loop !17

101:                                              ; preds = %91, %206
  %102 = phi i32 [ 0, %91 ], [ %207, %206 ]
  %103 = mul nsw i32 %102, %35
  %104 = add nsw i32 %29, %103
  br i1 %53, label %105, label %107

105:                                              ; preds = %101
  %106 = icmp slt i32 %104, %5
  br label %111

107:                                              ; preds = %134, %101
  %108 = phi float [ 0.000000e+00, %101 ], [ %199, %134 ]
  %109 = icmp slt i32 %104, %5
  %110 = select i1 %94, i1 %109, i1 false
  br i1 %110, label %202, label %206

111:                                              ; preds = %105, %134
  %112 = phi i32 [ 0, %105 ], [ %200, %134 ]
  %113 = phi float [ 0.000000e+00, %105 ], [ %199, %134 ]
  %114 = shl nsw i32 %112, 4
  %115 = add nuw i32 %114, %28
  %116 = icmp slt i32 %115, %3
  %117 = select i1 %116, i1 %94, i1 false
  br i1 %117, label %118, label %123

118:                                              ; preds = %111
  %119 = add i32 %115, %95
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %0, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !19
  br label %123

123:                                              ; preds = %111, %118
  %124 = phi float [ %122, %118 ], [ 0.000000e+00, %111 ]
  store float %124, float addrspace(3)* %54, align 4, !tbaa !19
  %125 = add nuw nsw i32 %114, %17
  %126 = icmp slt i32 %125, %3
  %127 = select i1 %126, i1 %106, i1 false
  br i1 %127, label %128, label %134

128:                                              ; preds = %123
  %129 = mul nsw i32 %125, %5
  %130 = add nsw i32 %129, %104
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %1, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !19
  br label %134

134:                                              ; preds = %123, %128
  %135 = phi float [ %133, %128 ], [ 0.000000e+00, %123 ]
  store float %135, float addrspace(3)* %55, align 4, !tbaa !19
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %136 = load float, float addrspace(3)* %57, align 16, !tbaa !19
  %137 = load float, float addrspace(3)* %58, align 4, !tbaa !19
  %138 = fmul contract float %136, %137
  %139 = fadd contract float %113, %138
  %140 = load float, float addrspace(3)* %59, align 4, !tbaa !19
  %141 = load float, float addrspace(3)* %60, align 4, !tbaa !19
  %142 = fmul contract float %140, %141
  %143 = fadd contract float %139, %142
  %144 = load float, float addrspace(3)* %61, align 8, !tbaa !19
  %145 = load float, float addrspace(3)* %62, align 4, !tbaa !19
  %146 = fmul contract float %144, %145
  %147 = fadd contract float %143, %146
  %148 = load float, float addrspace(3)* %63, align 4, !tbaa !19
  %149 = load float, float addrspace(3)* %64, align 4, !tbaa !19
  %150 = fmul contract float %148, %149
  %151 = fadd contract float %147, %150
  %152 = load float, float addrspace(3)* %65, align 16, !tbaa !19
  %153 = load float, float addrspace(3)* %66, align 4, !tbaa !19
  %154 = fmul contract float %152, %153
  %155 = fadd contract float %151, %154
  %156 = load float, float addrspace(3)* %67, align 4, !tbaa !19
  %157 = load float, float addrspace(3)* %68, align 4, !tbaa !19
  %158 = fmul contract float %156, %157
  %159 = fadd contract float %155, %158
  %160 = load float, float addrspace(3)* %69, align 8, !tbaa !19
  %161 = load float, float addrspace(3)* %70, align 4, !tbaa !19
  %162 = fmul contract float %160, %161
  %163 = fadd contract float %159, %162
  %164 = load float, float addrspace(3)* %71, align 4, !tbaa !19
  %165 = load float, float addrspace(3)* %72, align 4, !tbaa !19
  %166 = fmul contract float %164, %165
  %167 = fadd contract float %163, %166
  %168 = load float, float addrspace(3)* %73, align 16, !tbaa !19
  %169 = load float, float addrspace(3)* %74, align 4, !tbaa !19
  %170 = fmul contract float %168, %169
  %171 = fadd contract float %167, %170
  %172 = load float, float addrspace(3)* %75, align 4, !tbaa !19
  %173 = load float, float addrspace(3)* %76, align 4, !tbaa !19
  %174 = fmul contract float %172, %173
  %175 = fadd contract float %171, %174
  %176 = load float, float addrspace(3)* %77, align 8, !tbaa !19
  %177 = load float, float addrspace(3)* %78, align 4, !tbaa !19
  %178 = fmul contract float %176, %177
  %179 = fadd contract float %175, %178
  %180 = load float, float addrspace(3)* %79, align 4, !tbaa !19
  %181 = load float, float addrspace(3)* %80, align 4, !tbaa !19
  %182 = fmul contract float %180, %181
  %183 = fadd contract float %179, %182
  %184 = load float, float addrspace(3)* %81, align 16, !tbaa !19
  %185 = load float, float addrspace(3)* %82, align 4, !tbaa !19
  %186 = fmul contract float %184, %185
  %187 = fadd contract float %183, %186
  %188 = load float, float addrspace(3)* %83, align 4, !tbaa !19
  %189 = load float, float addrspace(3)* %84, align 4, !tbaa !19
  %190 = fmul contract float %188, %189
  %191 = fadd contract float %187, %190
  %192 = load float, float addrspace(3)* %85, align 8, !tbaa !19
  %193 = load float, float addrspace(3)* %86, align 4, !tbaa !19
  %194 = fmul contract float %192, %193
  %195 = fadd contract float %191, %194
  %196 = load float, float addrspace(3)* %87, align 4, !tbaa !19
  %197 = load float, float addrspace(3)* %88, align 4, !tbaa !19
  %198 = fmul contract float %196, %197
  %199 = fadd contract float %195, %198
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %200 = add nuw nsw i32 %112, 1
  %201 = icmp eq i32 %200, %56
  br i1 %201, label %107, label %111, !llvm.loop !23

202:                                              ; preds = %107
  %203 = add nsw i32 %104, %96
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds float, float addrspace(1)* %2, i64 %204
  store float %108, float addrspace(1)* %205, align 4, !tbaa !19
  br label %206

206:                                              ; preds = %202, %107
  %207 = add nuw nsw i32 %102, 1
  %208 = icmp eq i32 %207, %49
  br i1 %208, label %98, label %101, !llvm.loop !24
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 16}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!7, !11, i64 12}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.mustprogress"}
!19 = !{!20, !20, i64 0}
!20 = !{!"float", !21, i64 0}
!21 = !{!"omnipotent char", !22, i64 0}
!22 = !{!"Simple C++ TBAA"}
!23 = distinct !{!23, !18}
!24 = distinct !{!24, !18}
