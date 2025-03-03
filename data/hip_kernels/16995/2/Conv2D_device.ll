; ModuleID = '../data/hip_kernels/16995/2/main.cu'
source_filename = "../data/hip_kernels/16995/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ6Conv2DPfS_S_iiiE9sharedMem = internal unnamed_addr addrspace(3) global [36 x [36 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z6Conv2DPfS_S_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %8 = shl nuw nsw i32 %7, 5
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = add nuw nsw i32 %8, %9
  %11 = trunc i32 %10 to i16
  %12 = freeze i16 %11
  %13 = udiv i16 %12, 36
  %14 = zext i16 %13 to i32
  %15 = mul i16 %13, 36
  %16 = sub i16 %12, %15
  %17 = zext i16 %16 to i32
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = shl i32 %18, 5
  %20 = add i32 %19, %14
  %21 = sdiv i32 %5, -2
  %22 = add i32 %20, %21
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %24 = shl i32 %23, 5
  %25 = add i32 %24, %17
  %26 = add i32 %25, %21
  %27 = mul nsw i32 %22, %3
  %28 = add nsw i32 %27, %26
  %29 = icmp sgt i32 %22, -1
  br i1 %29, label %30, label %40

30:                                               ; preds = %6
  %31 = icmp slt i32 %22, %4
  %32 = icmp sgt i32 %26, -1
  %33 = select i1 %31, i1 %32, i1 false
  %34 = icmp slt i32 %26, %3
  %35 = select i1 %33, i1 %34, i1 false
  br i1 %35, label %36, label %40

36:                                               ; preds = %30
  %37 = sext i32 %28 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %40

40:                                               ; preds = %6, %30, %36
  %41 = phi float [ %39, %36 ], [ 0.000000e+00, %30 ], [ 0.000000e+00, %6 ]
  %42 = getelementptr inbounds [36 x [36 x float]], [36 x [36 x float]] addrspace(3)* @_ZZ6Conv2DPfS_S_iiiE9sharedMem, i32 0, i32 %14, i32 %17
  store float %41, float addrspace(3)* %42, align 4, !tbaa !5
  %43 = trunc i32 %10 to i16
  %44 = add nuw i16 %43, 1024
  %45 = freeze i16 %44
  %46 = udiv i16 %45, 36
  %47 = zext i16 %46 to i32
  %48 = mul i16 %46, 36
  %49 = sub i16 %45, %48
  %50 = zext i16 %49 to i32
  %51 = add i32 %19, %47
  %52 = add i32 %51, %21
  %53 = add i32 %24, %50
  %54 = add i32 %53, %21
  %55 = mul nsw i32 %52, %3
  %56 = add nsw i32 %55, %54
  %57 = icmp ult i32 %10, 272
  br i1 %57, label %58, label %73

58:                                               ; preds = %40
  %59 = icmp sgt i32 %52, -1
  br i1 %59, label %60, label %70

60:                                               ; preds = %58
  %61 = icmp slt i32 %52, %4
  %62 = icmp sgt i32 %54, -1
  %63 = select i1 %61, i1 %62, i1 false
  %64 = icmp slt i32 %54, %3
  %65 = select i1 %63, i1 %64, i1 false
  br i1 %65, label %66, label %70

66:                                               ; preds = %60
  %67 = sext i32 %56 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %0, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %70

70:                                               ; preds = %58, %60, %66
  %71 = phi float [ %69, %66 ], [ 0.000000e+00, %60 ], [ 0.000000e+00, %58 ]
  %72 = getelementptr inbounds [36 x [36 x float]], [36 x [36 x float]] addrspace(3)* @_ZZ6Conv2DPfS_S_iiiE9sharedMem, i32 0, i32 %47, i32 %50
  store float %71, float addrspace(3)* %72, align 4, !tbaa !5
  br label %73

73:                                               ; preds = %70, %40
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %74 = icmp sgt i32 %5, 0
  br i1 %74, label %75, label %85

75:                                               ; preds = %73
  %76 = and i32 %5, 7
  %77 = icmp ult i32 %5, 8
  %78 = and i32 %5, -8
  %79 = icmp eq i32 %76, 0
  br label %80

80:                                               ; preds = %75, %112
  %81 = phi i32 [ %114, %112 ], [ 0, %75 ]
  %82 = phi float [ %113, %112 ], [ 0.000000e+00, %75 ]
  %83 = add nuw i32 %81, %7
  %84 = mul nsw i32 %81, %5
  br i1 %77, label %92, label %116

85:                                               ; preds = %112, %73
  %86 = phi float [ 0.000000e+00, %73 ], [ %113, %112 ]
  %87 = add i32 %24, %9
  %88 = add i32 %19, %7
  %89 = icmp slt i32 %87, %3
  %90 = icmp slt i32 %88, %4
  %91 = select i1 %89, i1 %90, i1 false
  br i1 %91, label %202, label %209

92:                                               ; preds = %116, %80
  %93 = phi float [ undef, %80 ], [ %198, %116 ]
  %94 = phi i32 [ 0, %80 ], [ %199, %116 ]
  %95 = phi float [ %82, %80 ], [ %198, %116 ]
  br i1 %79, label %112, label %96

96:                                               ; preds = %92, %96
  %97 = phi i32 [ %109, %96 ], [ %94, %92 ]
  %98 = phi float [ %108, %96 ], [ %95, %92 ]
  %99 = phi i32 [ %110, %96 ], [ 0, %92 ]
  %100 = add nuw i32 %97, %9
  %101 = getelementptr inbounds [36 x [36 x float]], [36 x [36 x float]] addrspace(3)* @_ZZ6Conv2DPfS_S_iiiE9sharedMem, i32 0, i32 %83, i32 %100
  %102 = load float, float addrspace(3)* %101, align 4, !tbaa !5
  %103 = add nsw i32 %97, %84
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %1, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !5, !amdgpu.noclobber !9
  %107 = fmul contract float %102, %106
  %108 = fadd contract float %98, %107
  %109 = add nuw nsw i32 %97, 1
  %110 = add i32 %99, 1
  %111 = icmp eq i32 %110, %76
  br i1 %111, label %112, label %96, !llvm.loop !10

112:                                              ; preds = %96, %92
  %113 = phi float [ %93, %92 ], [ %108, %96 ]
  %114 = add nuw nsw i32 %81, 1
  %115 = icmp eq i32 %114, %5
  br i1 %115, label %85, label %80, !llvm.loop !12

116:                                              ; preds = %80, %116
  %117 = phi i32 [ %199, %116 ], [ 0, %80 ]
  %118 = phi float [ %198, %116 ], [ %82, %80 ]
  %119 = phi i32 [ %200, %116 ], [ 0, %80 ]
  %120 = add nuw i32 %117, %9
  %121 = getelementptr inbounds [36 x [36 x float]], [36 x [36 x float]] addrspace(3)* @_ZZ6Conv2DPfS_S_iiiE9sharedMem, i32 0, i32 %83, i32 %120
  %122 = load float, float addrspace(3)* %121, align 4, !tbaa !5
  %123 = add nsw i32 %117, %84
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %1, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !5, !amdgpu.noclobber !9
  %127 = fmul contract float %122, %126
  %128 = fadd contract float %118, %127
  %129 = or i32 %117, 1
  %130 = add nuw i32 %129, %9
  %131 = getelementptr inbounds [36 x [36 x float]], [36 x [36 x float]] addrspace(3)* @_ZZ6Conv2DPfS_S_iiiE9sharedMem, i32 0, i32 %83, i32 %130
  %132 = load float, float addrspace(3)* %131, align 4, !tbaa !5
  %133 = add nsw i32 %129, %84
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %1, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !5, !amdgpu.noclobber !9
  %137 = fmul contract float %132, %136
  %138 = fadd contract float %128, %137
  %139 = or i32 %117, 2
  %140 = add nuw i32 %139, %9
  %141 = getelementptr inbounds [36 x [36 x float]], [36 x [36 x float]] addrspace(3)* @_ZZ6Conv2DPfS_S_iiiE9sharedMem, i32 0, i32 %83, i32 %140
  %142 = load float, float addrspace(3)* %141, align 4, !tbaa !5
  %143 = add nsw i32 %139, %84
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %1, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !5, !amdgpu.noclobber !9
  %147 = fmul contract float %142, %146
  %148 = fadd contract float %138, %147
  %149 = or i32 %117, 3
  %150 = add nuw i32 %149, %9
  %151 = getelementptr inbounds [36 x [36 x float]], [36 x [36 x float]] addrspace(3)* @_ZZ6Conv2DPfS_S_iiiE9sharedMem, i32 0, i32 %83, i32 %150
  %152 = load float, float addrspace(3)* %151, align 4, !tbaa !5
  %153 = add nsw i32 %149, %84
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %1, i64 %154
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !5, !amdgpu.noclobber !9
  %157 = fmul contract float %152, %156
  %158 = fadd contract float %148, %157
  %159 = or i32 %117, 4
  %160 = add nuw i32 %159, %9
  %161 = getelementptr inbounds [36 x [36 x float]], [36 x [36 x float]] addrspace(3)* @_ZZ6Conv2DPfS_S_iiiE9sharedMem, i32 0, i32 %83, i32 %160
  %162 = load float, float addrspace(3)* %161, align 4, !tbaa !5
  %163 = add nsw i32 %159, %84
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %1, i64 %164
  %166 = load float, float addrspace(1)* %165, align 4, !tbaa !5, !amdgpu.noclobber !9
  %167 = fmul contract float %162, %166
  %168 = fadd contract float %158, %167
  %169 = or i32 %117, 5
  %170 = add nuw i32 %169, %9
  %171 = getelementptr inbounds [36 x [36 x float]], [36 x [36 x float]] addrspace(3)* @_ZZ6Conv2DPfS_S_iiiE9sharedMem, i32 0, i32 %83, i32 %170
  %172 = load float, float addrspace(3)* %171, align 4, !tbaa !5
  %173 = add nsw i32 %169, %84
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds float, float addrspace(1)* %1, i64 %174
  %176 = load float, float addrspace(1)* %175, align 4, !tbaa !5, !amdgpu.noclobber !9
  %177 = fmul contract float %172, %176
  %178 = fadd contract float %168, %177
  %179 = or i32 %117, 6
  %180 = add nuw i32 %179, %9
  %181 = getelementptr inbounds [36 x [36 x float]], [36 x [36 x float]] addrspace(3)* @_ZZ6Conv2DPfS_S_iiiE9sharedMem, i32 0, i32 %83, i32 %180
  %182 = load float, float addrspace(3)* %181, align 4, !tbaa !5
  %183 = add nsw i32 %179, %84
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds float, float addrspace(1)* %1, i64 %184
  %186 = load float, float addrspace(1)* %185, align 4, !tbaa !5, !amdgpu.noclobber !9
  %187 = fmul contract float %182, %186
  %188 = fadd contract float %178, %187
  %189 = or i32 %117, 7
  %190 = add nuw i32 %189, %9
  %191 = getelementptr inbounds [36 x [36 x float]], [36 x [36 x float]] addrspace(3)* @_ZZ6Conv2DPfS_S_iiiE9sharedMem, i32 0, i32 %83, i32 %190
  %192 = load float, float addrspace(3)* %191, align 4, !tbaa !5
  %193 = add nsw i32 %189, %84
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds float, float addrspace(1)* %1, i64 %194
  %196 = load float, float addrspace(1)* %195, align 4, !tbaa !5, !amdgpu.noclobber !9
  %197 = fmul contract float %192, %196
  %198 = fadd contract float %188, %197
  %199 = add nuw nsw i32 %117, 8
  %200 = add i32 %119, 8
  %201 = icmp eq i32 %200, %78
  br i1 %201, label %92, label %116, !llvm.loop !14

202:                                              ; preds = %85
  %203 = tail call float @llvm.maxnum.f32(float %86, float 0.000000e+00)
  %204 = tail call float @llvm.minnum.f32(float %203, float 1.000000e+00)
  %205 = mul nsw i32 %88, %3
  %206 = add nsw i32 %205, %87
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds float, float addrspace(1)* %2, i64 %207
  store float %204, float addrspace(1)* %208, align 4, !tbaa !5
  br label %209

209:                                              ; preds = %202, %85
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #2

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
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !13}
