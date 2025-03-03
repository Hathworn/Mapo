; ModuleID = '../data/hip_kernels/18347/6/main.cu'
source_filename = "../data/hip_kernels/18347/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sharedMem = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15cuSearchDoubletPKiPKfS0_S2_S0_S2_S2_S2_S2_S2_S2_PiS3_S3_S3_S3_S3_S3_S3_S3_S3_(i32 addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture readonly %8, float addrspace(1)* nocapture readonly %9, float addrspace(1)* nocapture readonly %10, i32 addrspace(1)* nocapture %11, i32 addrspace(1)* nocapture %12, i32 addrspace(1)* nocapture %13, i32 addrspace(1)* nocapture %14, i32 addrspace(1)* nocapture %15, i32 addrspace(1)* nocapture writeonly %16, i32 addrspace(1)* nocapture writeonly %17, i32 addrspace(1)* nocapture %18, i32 addrspace(1)* nocapture writeonly %19, i32 addrspace(1)* nocapture %20) local_unnamed_addr #0 {
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %25

24:                                               ; preds = %21
  store i32 0, i32 addrspace(3)* bitcast (float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 1) to i32 addrspace(3)*), align 4, !tbaa !5
  br label %25

25:                                               ; preds = %24, %21
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %26 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %27 = load i32, i32 addrspace(1)* %0, align 4, !tbaa !5, !amdgpu.noclobber !9
  %28 = mul nsw i32 %27, 3
  %29 = add i32 %28, %26
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %1, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !10, !amdgpu.noclobber !9
  %33 = shl nsw i32 %27, 1
  %34 = add i32 %33, %26
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %1, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !10, !amdgpu.noclobber !9
  %38 = load i32, i32 addrspace(1)* %2, align 4, !tbaa !5
  %39 = load i32, i32 addrspace(1)* %4, align 4, !tbaa !5
  %40 = tail call i32 @llvm.smax.i32(i32 %38, i32 %39)
  %41 = icmp sgt i32 %40, 0
  br i1 %41, label %42, label %144

42:                                               ; preds = %25
  %43 = zext i32 %26 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %14, i64 %43
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %43
  %46 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %47 = getelementptr i8, i8 addrspace(4)* %46, i64 4
  %48 = bitcast i8 addrspace(4)* %47 to i16 addrspace(4)*
  %49 = load i16, i16 addrspace(4)* %48, align 4, !range !12, !invariant.load !9
  %50 = zext i16 %49 to i32
  br label %51

51:                                               ; preds = %42, %138
  %52 = phi i32 [ %39, %42 ], [ %139, %138 ]
  %53 = phi i32 [ %38, %42 ], [ %141, %138 ]
  %54 = phi i32 [ 0, %42 ], [ %140, %138 ]
  %55 = add i32 %54, %22
  %56 = icmp ult i32 %55, %53
  br i1 %56, label %57, label %96

57:                                               ; preds = %51
  %58 = mul nsw i32 %53, 3
  %59 = add i32 %58, %55
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %3, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !10
  %63 = shl nsw i32 %53, 1
  %64 = add i32 %63, %55
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %3, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !10
  %68 = fsub contract float %32, %62
  %69 = fsub contract float %37, %67
  %70 = fdiv contract float %69, %68
  %71 = fmul contract float %32, %70
  %72 = fsub contract float %37, %71
  %73 = load float, float addrspace(1)* %9, align 4, !tbaa !10
  %74 = fcmp contract olt float %72, %73
  br i1 %74, label %96, label %75

75:                                               ; preds = %57
  %76 = tail call float @llvm.fabs.f32(float %70)
  %77 = load float, float addrspace(1)* %8, align 4, !tbaa !10
  %78 = fcmp contract ogt float %76, %77
  %79 = load float, float addrspace(1)* %7, align 4, !tbaa !10
  %80 = fcmp contract ogt float %68, %79
  %81 = load float, float addrspace(1)* %6, align 4, !tbaa !10
  %82 = fcmp contract olt float %68, %81
  %83 = load float, float addrspace(1)* %10, align 4, !tbaa !10
  %84 = fcmp contract ogt float %72, %83
  %85 = select i1 %84, i1 true, i1 %78
  %86 = select i1 %85, i1 true, i1 %82
  %87 = select i1 %86, i1 true, i1 %80
  br i1 %87, label %96, label %88

88:                                               ; preds = %75
  %89 = atomicrmw add i32 addrspace(1)* %44, i32 1 syncscope("agent-one-as") monotonic, align 4
  %90 = load i32, i32 addrspace(1)* %2, align 4, !tbaa !5
  %91 = mul i32 %90, %26
  %92 = add i32 %91, %89
  %93 = zext i32 %92 to i64
  %94 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %93
  store i32 %55, i32 addrspace(1)* %94, align 4, !tbaa !5
  %95 = load i32, i32 addrspace(1)* %4, align 4, !tbaa !5
  br label %96

96:                                               ; preds = %75, %57, %88, %51
  %97 = phi i32 [ %52, %75 ], [ %52, %57 ], [ %95, %88 ], [ %52, %51 ]
  %98 = icmp ult i32 %55, %97
  br i1 %98, label %99, label %138

99:                                               ; preds = %96
  %100 = mul nsw i32 %97, 3
  %101 = add i32 %100, %55
  %102 = zext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %5, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !10
  %105 = fsub contract float %104, %32
  %106 = load float, float addrspace(1)* %6, align 4, !tbaa !10
  %107 = fcmp contract uge float %105, %106
  %108 = load float, float addrspace(1)* %7, align 4, !tbaa !10
  %109 = fcmp contract ule float %105, %108
  %110 = select i1 %109, i1 %107, i1 false
  br i1 %110, label %111, label %138

111:                                              ; preds = %99
  %112 = shl nsw i32 %97, 1
  %113 = add i32 %112, %55
  %114 = zext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %5, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !10
  %117 = fsub contract float %116, %37
  %118 = fdiv contract float %117, %105
  %119 = fmul contract float %32, %118
  %120 = fsub contract float %37, %119
  %121 = load float, float addrspace(1)* %9, align 4, !tbaa !10
  %122 = fcmp contract olt float %120, %121
  br i1 %122, label %138, label %123

123:                                              ; preds = %111
  %124 = tail call float @llvm.fabs.f32(float %118)
  %125 = load float, float addrspace(1)* %8, align 4, !tbaa !10
  %126 = fcmp contract ogt float %124, %125
  %127 = load float, float addrspace(1)* %10, align 4, !tbaa !10
  %128 = fcmp contract ogt float %120, %127
  %129 = select i1 %128, i1 true, i1 %126
  br i1 %129, label %138, label %130

130:                                              ; preds = %123
  %131 = atomicrmw add i32 addrspace(1)* %45, i32 1 syncscope("agent-one-as") monotonic, align 4
  %132 = load i32, i32 addrspace(1)* %4, align 4, !tbaa !5
  %133 = mul i32 %132, %26
  %134 = add i32 %133, %131
  %135 = zext i32 %134 to i64
  %136 = getelementptr inbounds i32, i32 addrspace(1)* %20, i64 %135
  store i32 %55, i32 addrspace(1)* %136, align 4, !tbaa !5
  %137 = load i32, i32 addrspace(1)* %4, align 4, !tbaa !5
  br label %138

138:                                              ; preds = %99, %123, %111, %130, %96
  %139 = phi i32 [ %97, %99 ], [ %97, %123 ], [ %97, %111 ], [ %137, %130 ], [ %97, %96 ]
  %140 = add i32 %54, %50
  %141 = load i32, i32 addrspace(1)* %2, align 4, !tbaa !5
  %142 = tail call i32 @llvm.smax.i32(i32 %141, i32 %139)
  %143 = icmp slt i32 %140, %142
  br i1 %143, label %51, label %144, !llvm.loop !13

144:                                              ; preds = %138, %25
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %23, label %145, label %162

145:                                              ; preds = %144
  %146 = zext i32 %26 to i64
  %147 = getelementptr inbounds i32, i32 addrspace(1)* %14, i64 %146
  %148 = load i32, i32 addrspace(1)* %147, align 4, !tbaa !5
  %149 = icmp sgt i32 %148, 0
  br i1 %149, label %150, label %162

150:                                              ; preds = %145
  %151 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %146
  %152 = load i32, i32 addrspace(1)* %151, align 4, !tbaa !5
  %153 = icmp sgt i32 %152, 0
  br i1 %153, label %154, label %162

154:                                              ; preds = %150
  %155 = atomicrmw add i32 addrspace(1)* %11, i32 1 syncscope("agent-one-as") monotonic, align 4
  store i32 %155, i32 addrspace(3)* bitcast ([0 x float] addrspace(3)* @sharedMem to i32 addrspace(3)*), align 4, !tbaa !5
  store i32 1, i32 addrspace(3)* bitcast (float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 1) to i32 addrspace(3)*), align 4, !tbaa !5
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds i32, i32 addrspace(1)* %16, i64 %156
  store i32 %26, i32 addrspace(1)* %157, align 4, !tbaa !5
  %158 = load i32, i32 addrspace(1)* %147, align 4, !tbaa !5
  %159 = atomicrmw max i32 addrspace(1)* %12, i32 %158 syncscope("agent-one-as") monotonic, align 4
  %160 = load i32, i32 addrspace(1)* %151, align 4, !tbaa !5
  %161 = atomicrmw max i32 addrspace(1)* %13, i32 %160 syncscope("agent-one-as") monotonic, align 4
  br label %162

162:                                              ; preds = %145, %150, %154, %144
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %163 = load i32, i32 addrspace(3)* bitcast (float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @sharedMem, i32 0, i32 1) to i32 addrspace(3)*), align 4, !tbaa !5
  %164 = icmp eq i32 %163, 1
  br i1 %164, label %165, label %220

165:                                              ; preds = %162
  %166 = zext i32 %26 to i64
  %167 = getelementptr inbounds i32, i32 addrspace(1)* %14, i64 %166
  %168 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %166
  %169 = load i32, i32 addrspace(1)* %167, align 4, !tbaa !5
  %170 = load i32, i32 addrspace(1)* %168, align 4, !tbaa !5
  %171 = tail call i32 @llvm.smax.i32(i32 %169, i32 %170)
  %172 = icmp sgt i32 %171, 0
  br i1 %172, label %173, label %220

173:                                              ; preds = %165
  %174 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %175 = getelementptr i8, i8 addrspace(4)* %174, i64 4
  %176 = bitcast i8 addrspace(4)* %175 to i16 addrspace(4)*
  %177 = load i16, i16 addrspace(4)* %176, align 4, !range !12, !invariant.load !9
  %178 = zext i16 %177 to i32
  br label %179

179:                                              ; preds = %173, %214
  %180 = phi i32 [ %170, %173 ], [ %215, %214 ]
  %181 = phi i32 [ %169, %173 ], [ %217, %214 ]
  %182 = phi i32 [ 0, %173 ], [ %216, %214 ]
  %183 = add i32 %182, %22
  %184 = icmp ult i32 %183, %181
  br i1 %184, label %185, label %198

185:                                              ; preds = %179
  %186 = load i32, i32 addrspace(1)* %2, align 4, !tbaa !5
  %187 = mul i32 %186, %26
  %188 = add i32 %187, %183
  %189 = zext i32 %188 to i64
  %190 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %189
  %191 = load i32, i32 addrspace(1)* %190, align 4, !tbaa !5
  %192 = load i32, i32 addrspace(3)* bitcast ([0 x float] addrspace(3)* @sharedMem to i32 addrspace(3)*), align 4, !tbaa !5
  %193 = mul nsw i32 %192, %186
  %194 = add i32 %193, %183
  %195 = zext i32 %194 to i64
  %196 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %195
  store i32 %191, i32 addrspace(1)* %196, align 4, !tbaa !5
  %197 = load i32, i32 addrspace(1)* %168, align 4, !tbaa !5
  br label %198

198:                                              ; preds = %185, %179
  %199 = phi i32 [ %197, %185 ], [ %180, %179 ]
  %200 = icmp ult i32 %183, %199
  br i1 %200, label %201, label %214

201:                                              ; preds = %198
  %202 = load i32, i32 addrspace(1)* %4, align 4, !tbaa !5
  %203 = mul i32 %202, %26
  %204 = add i32 %203, %183
  %205 = zext i32 %204 to i64
  %206 = getelementptr inbounds i32, i32 addrspace(1)* %20, i64 %205
  %207 = load i32, i32 addrspace(1)* %206, align 4, !tbaa !5
  %208 = load i32, i32 addrspace(3)* bitcast ([0 x float] addrspace(3)* @sharedMem to i32 addrspace(3)*), align 4, !tbaa !5
  %209 = mul nsw i32 %208, %202
  %210 = add i32 %209, %183
  %211 = zext i32 %210 to i64
  %212 = getelementptr inbounds i32, i32 addrspace(1)* %19, i64 %211
  store i32 %207, i32 addrspace(1)* %212, align 4, !tbaa !5
  %213 = load i32, i32 addrspace(1)* %168, align 4, !tbaa !5
  br label %214

214:                                              ; preds = %201, %198
  %215 = phi i32 [ %213, %201 ], [ %199, %198 ]
  %216 = add i32 %182, %178
  %217 = load i32, i32 addrspace(1)* %167, align 4, !tbaa !5
  %218 = tail call i32 @llvm.smax.i32(i32 %217, i32 %215)
  %219 = icmp slt i32 %216, %218
  br i1 %219, label %179, label %220, !llvm.loop !15

220:                                              ; preds = %214, %165, %162
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #4

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !7, i64 0}
!12 = !{i16 1, i16 1025}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
