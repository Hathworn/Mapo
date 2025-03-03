; ModuleID = '../data/hip_kernels/2758/36/main.cu'
source_filename = "../data/hip_kernels/2758/36/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ23convolve_bin_gpu_kernelPfS_S_iiiiiiiS_E14weights_shared = internal unnamed_addr addrspace(3) global [1729 x i32] undef, align 16
@_ZZ23convolve_bin_gpu_kernelPfS_S_iiiiiiiS_E12input_shared = internal unnamed_addr addrspace(3) global [5409 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z23convolve_bin_gpu_kernelPfS_S_iiiiiiiS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, float addrspace(1)* nocapture readonly %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %12, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %20 = add i32 %18, %19
  %21 = freeze i32 %20
  %22 = freeze i32 %3
  %23 = sdiv i32 %21, %22
  %24 = mul i32 %23, %22
  %25 = sub i32 %21, %24
  %26 = freeze i32 %4
  %27 = sdiv i32 %23, %26
  %28 = mul i32 %27, %26
  %29 = sub i32 %23, %28
  %30 = sdiv i32 %18, %3
  %31 = sdiv i32 %30, %4
  %32 = add i32 %12, 1
  %33 = mul i32 %32, %17
  %34 = add i32 %33, -1
  %35 = sdiv i32 %34, %3
  %36 = sdiv i32 %35, %4
  %37 = mul nsw i32 %7, %7
  %38 = mul nsw i32 %37, %5
  %39 = sdiv i32 %38, 32
  %40 = icmp sgt i32 %31, %36
  br i1 %40, label %51, label %41

41:                                               ; preds = %11
  %42 = icmp sgt i32 %19, %39
  br label %43

43:                                               ; preds = %41, %69
  %44 = phi i32 [ %31, %41 ], [ %70, %69 ]
  br i1 %42, label %69, label %45

45:                                               ; preds = %43
  %46 = mul nsw i32 %44, %9
  %47 = sdiv i32 %46, 32
  %48 = sub nsw i32 %44, %31
  %49 = mul nsw i32 %48, %9
  %50 = sdiv i32 %49, 32
  br label %72

51:                                               ; preds = %69, %11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %52 = icmp sgt i32 %5, 0
  br i1 %52, label %53, label %237

53:                                               ; preds = %51
  %54 = mul i32 %4, %3
  %55 = sdiv i32 %54, 32
  %56 = icmp sgt i32 %19, %55
  %57 = icmp sge i32 %27, %6
  %58 = icmp slt i32 %7, 1
  %59 = sub i32 %29, %8
  %60 = icmp sgt i32 %7, 0
  %61 = sub i32 %25, %8
  %62 = sub nsw i32 %27, %31
  %63 = mul nsw i32 %62, %9
  %64 = select i1 %57, i1 true, i1 %58
  %65 = and i32 %7, 1
  %66 = icmp eq i32 %7, 1
  %67 = and i32 %7, -2
  %68 = icmp eq i32 %65, 0
  br label %83

69:                                               ; preds = %72, %43
  %70 = add nsw i32 %44, 1
  %71 = icmp slt i32 %44, %36
  br i1 %71, label %43, label %51, !llvm.loop !7

72:                                               ; preds = %45, %72
  %73 = phi i32 [ %19, %45 ], [ %81, %72 ]
  %74 = add nsw i32 %73, %47
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %1, i64 %75
  %77 = bitcast float addrspace(1)* %76 to i32 addrspace(1)*
  %78 = load i32, i32 addrspace(1)* %77, align 4, !tbaa !9, !amdgpu.noclobber !5
  %79 = add nsw i32 %73, %50
  %80 = getelementptr inbounds [1729 x i32], [1729 x i32] addrspace(3)* @_ZZ23convolve_bin_gpu_kernelPfS_S_iiiiiiiS_E14weights_shared, i32 0, i32 %79
  store i32 %78, i32 addrspace(3)* %80, align 4, !tbaa !9
  %81 = add nuw nsw i32 %73, %17
  %82 = icmp sgt i32 %81, %39
  br i1 %82, label %69, label %72, !llvm.loop !13

83:                                               ; preds = %53, %232
  %84 = phi i32 [ 0, %53 ], [ %235, %232 ]
  %85 = phi i32 [ 0, %53 ], [ %234, %232 ]
  %86 = phi i32 [ 0, %53 ], [ %233, %232 ]
  %87 = mul i32 %54, %84
  %88 = freeze i32 %87
  %89 = sdiv i32 %88, 32
  %90 = mul i32 %89, 32
  %91 = sub i32 %88, %90
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %56, label %92, label %95

92:                                               ; preds = %95, %83
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %64, label %232, label %93

93:                                               ; preds = %92
  %94 = mul i32 %84, %7
  br label %105

95:                                               ; preds = %83, %95
  %96 = phi i32 [ %103, %95 ], [ %19, %83 ]
  %97 = add nsw i32 %96, %89
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %0, i64 %98
  %100 = bitcast float addrspace(1)* %99 to i32 addrspace(1)*
  %101 = load i32, i32 addrspace(1)* %100, align 4, !tbaa !9, !amdgpu.noclobber !5
  %102 = getelementptr inbounds [5409 x i32], [5409 x i32] addrspace(3)* @_ZZ23convolve_bin_gpu_kernelPfS_S_iiiiiiiS_E12input_shared, i32 0, i32 %96
  store i32 %101, i32 addrspace(3)* %102, align 4, !tbaa !9
  %103 = add nuw nsw i32 %96, %17
  %104 = icmp sgt i32 %103, %55
  br i1 %104, label %92, label %95, !llvm.loop !14

105:                                              ; preds = %93, %227
  %106 = phi i32 [ 0, %93 ], [ %230, %227 ]
  %107 = phi i32 [ %85, %93 ], [ %229, %227 ]
  %108 = phi i32 [ %86, %93 ], [ %228, %227 ]
  %109 = add i32 %59, %106
  br i1 %60, label %110, label %227

110:                                              ; preds = %105
  %111 = icmp sgt i32 %109, -1
  %112 = icmp slt i32 %109, %4
  %113 = add i32 %106, %94
  %114 = mul i32 %113, %7
  %115 = add i32 %114, %63
  %116 = mul nsw i32 %109, %3
  %117 = add i32 %116, %91
  br i1 %66, label %191, label %118

118:                                              ; preds = %110, %185
  %119 = phi i32 [ %188, %185 ], [ 0, %110 ]
  %120 = phi i32 [ %187, %185 ], [ %107, %110 ]
  %121 = phi i32 [ %186, %185 ], [ %108, %110 ]
  %122 = phi i32 [ %189, %185 ], [ 0, %110 ]
  %123 = add i32 %61, %119
  %124 = icmp sgt i32 %123, -1
  %125 = select i1 %111, i1 %124, i1 false
  %126 = select i1 %125, i1 %112, i1 false
  %127 = icmp slt i32 %123, %3
  %128 = select i1 %126, i1 %127, i1 false
  br i1 %128, label %129, label %152

129:                                              ; preds = %118
  %130 = add i32 %115, %119
  %131 = and i32 %130, 7
  %132 = ashr i32 %130, 3
  %133 = getelementptr inbounds i8, i8 addrspace(3)* bitcast ([1729 x i32] addrspace(3)* @_ZZ23convolve_bin_gpu_kernelPfS_S_iiiiiiiS_E14weights_shared to i8 addrspace(3)*), i32 %132
  %134 = load i8, i8 addrspace(3)* %133, align 1, !tbaa !15
  %135 = zext i8 %134 to i32
  %136 = shl nuw nsw i32 1, %131
  %137 = and i32 %136, %135
  %138 = icmp eq i32 %137, 0
  %139 = add i32 %117, %123
  %140 = and i32 %139, 7
  %141 = ashr i32 %139, 3
  %142 = getelementptr inbounds i8, i8 addrspace(3)* bitcast ([5409 x i32] addrspace(3)* @_ZZ23convolve_bin_gpu_kernelPfS_S_iiiiiiiS_E12input_shared to i8 addrspace(3)*), i32 %141
  %143 = load i8, i8 addrspace(3)* %142, align 1, !tbaa !15
  %144 = zext i8 %143 to i32
  %145 = shl nuw nsw i32 1, %140
  %146 = and i32 %145, %144
  %147 = icmp ne i32 %146, 0
  %148 = xor i1 %138, %147
  %149 = zext i1 %148 to i32
  %150 = add nsw i32 %120, %149
  %151 = add nsw i32 %121, 1
  br label %152

152:                                              ; preds = %118, %129
  %153 = phi i32 [ %151, %129 ], [ %121, %118 ]
  %154 = phi i32 [ %150, %129 ], [ %120, %118 ]
  %155 = or i32 %119, 1
  %156 = add i32 %61, %155
  %157 = icmp sgt i32 %156, -1
  %158 = select i1 %111, i1 %157, i1 false
  %159 = select i1 %158, i1 %112, i1 false
  %160 = icmp slt i32 %156, %3
  %161 = select i1 %159, i1 %160, i1 false
  br i1 %161, label %162, label %185

162:                                              ; preds = %152
  %163 = add i32 %115, %155
  %164 = and i32 %163, 7
  %165 = ashr i32 %163, 3
  %166 = getelementptr inbounds i8, i8 addrspace(3)* bitcast ([1729 x i32] addrspace(3)* @_ZZ23convolve_bin_gpu_kernelPfS_S_iiiiiiiS_E14weights_shared to i8 addrspace(3)*), i32 %165
  %167 = load i8, i8 addrspace(3)* %166, align 1, !tbaa !15
  %168 = zext i8 %167 to i32
  %169 = shl nuw nsw i32 1, %164
  %170 = and i32 %169, %168
  %171 = icmp eq i32 %170, 0
  %172 = add i32 %117, %156
  %173 = and i32 %172, 7
  %174 = ashr i32 %172, 3
  %175 = getelementptr inbounds i8, i8 addrspace(3)* bitcast ([5409 x i32] addrspace(3)* @_ZZ23convolve_bin_gpu_kernelPfS_S_iiiiiiiS_E12input_shared to i8 addrspace(3)*), i32 %174
  %176 = load i8, i8 addrspace(3)* %175, align 1, !tbaa !15
  %177 = zext i8 %176 to i32
  %178 = shl nuw nsw i32 1, %173
  %179 = and i32 %178, %177
  %180 = icmp ne i32 %179, 0
  %181 = xor i1 %171, %180
  %182 = zext i1 %181 to i32
  %183 = add nsw i32 %154, %182
  %184 = add nsw i32 %153, 1
  br label %185

185:                                              ; preds = %162, %152
  %186 = phi i32 [ %184, %162 ], [ %153, %152 ]
  %187 = phi i32 [ %183, %162 ], [ %154, %152 ]
  %188 = add nuw nsw i32 %119, 2
  %189 = add i32 %122, 2
  %190 = icmp eq i32 %189, %67
  br i1 %190, label %191, label %118, !llvm.loop !16

191:                                              ; preds = %185, %110
  %192 = phi i32 [ undef, %110 ], [ %186, %185 ]
  %193 = phi i32 [ undef, %110 ], [ %187, %185 ]
  %194 = phi i32 [ 0, %110 ], [ %188, %185 ]
  %195 = phi i32 [ %107, %110 ], [ %187, %185 ]
  %196 = phi i32 [ %108, %110 ], [ %186, %185 ]
  br i1 %68, label %227, label %197

197:                                              ; preds = %191
  %198 = add i32 %61, %194
  %199 = icmp sgt i32 %198, -1
  %200 = select i1 %111, i1 %199, i1 false
  %201 = select i1 %200, i1 %112, i1 false
  %202 = icmp slt i32 %198, %3
  %203 = select i1 %201, i1 %202, i1 false
  br i1 %203, label %204, label %227

204:                                              ; preds = %197
  %205 = add i32 %115, %194
  %206 = and i32 %205, 7
  %207 = ashr i32 %205, 3
  %208 = getelementptr inbounds i8, i8 addrspace(3)* bitcast ([1729 x i32] addrspace(3)* @_ZZ23convolve_bin_gpu_kernelPfS_S_iiiiiiiS_E14weights_shared to i8 addrspace(3)*), i32 %207
  %209 = load i8, i8 addrspace(3)* %208, align 1, !tbaa !15
  %210 = zext i8 %209 to i32
  %211 = shl nuw nsw i32 1, %206
  %212 = and i32 %211, %210
  %213 = icmp eq i32 %212, 0
  %214 = add i32 %117, %198
  %215 = and i32 %214, 7
  %216 = ashr i32 %214, 3
  %217 = getelementptr inbounds i8, i8 addrspace(3)* bitcast ([5409 x i32] addrspace(3)* @_ZZ23convolve_bin_gpu_kernelPfS_S_iiiiiiiS_E12input_shared to i8 addrspace(3)*), i32 %216
  %218 = load i8, i8 addrspace(3)* %217, align 1, !tbaa !15
  %219 = zext i8 %218 to i32
  %220 = shl nuw nsw i32 1, %215
  %221 = and i32 %220, %219
  %222 = icmp ne i32 %221, 0
  %223 = xor i1 %213, %222
  %224 = zext i1 %223 to i32
  %225 = add nsw i32 %195, %224
  %226 = add nsw i32 %196, 1
  br label %227

227:                                              ; preds = %191, %204, %197, %105
  %228 = phi i32 [ %108, %105 ], [ %192, %191 ], [ %226, %204 ], [ %196, %197 ]
  %229 = phi i32 [ %107, %105 ], [ %193, %191 ], [ %225, %204 ], [ %195, %197 ]
  %230 = add nuw nsw i32 %106, 1
  %231 = icmp eq i32 %230, %7
  br i1 %231, label %232, label %105, !llvm.loop !17

232:                                              ; preds = %227, %92
  %233 = phi i32 [ %86, %92 ], [ %228, %227 ]
  %234 = phi i32 [ %85, %92 ], [ %229, %227 ]
  %235 = add nuw nsw i32 %84, 1
  %236 = icmp eq i32 %235, %5
  br i1 %236, label %237, label %83, !llvm.loop !18

237:                                              ; preds = %232, %51
  %238 = phi i32 [ 0, %51 ], [ %233, %232 ]
  %239 = phi i32 [ 0, %51 ], [ %234, %232 ]
  %240 = mul i32 %27, %4
  %241 = add i32 %240, %29
  %242 = mul i32 %241, %3
  %243 = add i32 %242, %25
  %244 = shl i32 %239, 1
  %245 = sub i32 %244, %238
  %246 = sext i32 %243 to i64
  %247 = getelementptr inbounds float, float addrspace(1)* %2, i64 %246
  %248 = sitofp i32 %245 to float
  %249 = sext i32 %27 to i64
  %250 = getelementptr inbounds float, float addrspace(1)* %10, i64 %249
  %251 = load float, float addrspace(1)* %250, align 4, !tbaa !19, !amdgpu.noclobber !5
  %252 = fmul contract float %251, %248
  %253 = atomicrmw fadd float addrspace(1)* %247, float %252 syncscope("agent-one-as") monotonic, align 4
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C++ TBAA"}
!13 = distinct !{!13, !8}
!14 = distinct !{!14, !8}
!15 = !{!11, !11, i64 0}
!16 = distinct !{!16, !8}
!17 = distinct !{!17, !8}
!18 = distinct !{!18, !8}
!19 = !{!20, !20, i64 0}
!20 = !{!"float", !11, i64 0}
