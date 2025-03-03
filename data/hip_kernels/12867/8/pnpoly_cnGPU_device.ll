; ModuleID = '../data/hip_kernels/12867/8/main.cu'
source_filename = "../data/hip_kernels/12867/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@s = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12pnpoly_cnGPUPcPKfS1_S1_S1_ii(i8 addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %6
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = icmp slt i32 %17, %5
  br i1 %18, label %19, label %245

19:                                               ; preds = %7
  %20 = icmp sgt i32 %6, 0
  br i1 %20, label %21, label %129

21:                                               ; preds = %19
  %22 = and i32 %6, 7
  %23 = icmp ult i32 %6, 8
  br i1 %23, label %111, label %24

24:                                               ; preds = %21
  %25 = and i32 %6, -8
  br label %26

26:                                               ; preds = %26, %24
  %27 = phi i32 [ 0, %24 ], [ %108, %26 ]
  %28 = phi i32 [ 0, %24 ], [ %109, %26 ]
  %29 = zext i32 %27 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %3, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !5
  %32 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %27
  %33 = bitcast i32 addrspace(3)* %32 to float addrspace(3)*
  store float %31, float addrspace(3)* %33, align 4, !tbaa !7
  %34 = getelementptr inbounds float, float addrspace(1)* %4, i64 %29
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = getelementptr inbounds i32, i32 addrspace(3)* %8, i32 %27
  %37 = bitcast i32 addrspace(3)* %36 to float addrspace(3)*
  store float %35, float addrspace(3)* %37, align 4, !tbaa !7
  %38 = or i32 %27, 1
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %3, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !7, !amdgpu.noclobber !5
  %42 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %38
  %43 = bitcast i32 addrspace(3)* %42 to float addrspace(3)*
  store float %41, float addrspace(3)* %43, align 4, !tbaa !7
  %44 = getelementptr inbounds float, float addrspace(1)* %4, i64 %39
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !7, !amdgpu.noclobber !5
  %46 = getelementptr inbounds i32, i32 addrspace(3)* %8, i32 %38
  %47 = bitcast i32 addrspace(3)* %46 to float addrspace(3)*
  store float %45, float addrspace(3)* %47, align 4, !tbaa !7
  %48 = or i32 %27, 2
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %3, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !7, !amdgpu.noclobber !5
  %52 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %48
  %53 = bitcast i32 addrspace(3)* %52 to float addrspace(3)*
  store float %51, float addrspace(3)* %53, align 4, !tbaa !7
  %54 = getelementptr inbounds float, float addrspace(1)* %4, i64 %49
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7, !amdgpu.noclobber !5
  %56 = getelementptr inbounds i32, i32 addrspace(3)* %8, i32 %48
  %57 = bitcast i32 addrspace(3)* %56 to float addrspace(3)*
  store float %55, float addrspace(3)* %57, align 4, !tbaa !7
  %58 = or i32 %27, 3
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %3, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !7, !amdgpu.noclobber !5
  %62 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %58
  %63 = bitcast i32 addrspace(3)* %62 to float addrspace(3)*
  store float %61, float addrspace(3)* %63, align 4, !tbaa !7
  %64 = getelementptr inbounds float, float addrspace(1)* %4, i64 %59
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !5
  %66 = getelementptr inbounds i32, i32 addrspace(3)* %8, i32 %58
  %67 = bitcast i32 addrspace(3)* %66 to float addrspace(3)*
  store float %65, float addrspace(3)* %67, align 4, !tbaa !7
  %68 = or i32 %27, 4
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %3, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !7, !amdgpu.noclobber !5
  %72 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %68
  %73 = bitcast i32 addrspace(3)* %72 to float addrspace(3)*
  store float %71, float addrspace(3)* %73, align 4, !tbaa !7
  %74 = getelementptr inbounds float, float addrspace(1)* %4, i64 %69
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !7, !amdgpu.noclobber !5
  %76 = getelementptr inbounds i32, i32 addrspace(3)* %8, i32 %68
  %77 = bitcast i32 addrspace(3)* %76 to float addrspace(3)*
  store float %75, float addrspace(3)* %77, align 4, !tbaa !7
  %78 = or i32 %27, 5
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %3, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !7, !amdgpu.noclobber !5
  %82 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %78
  %83 = bitcast i32 addrspace(3)* %82 to float addrspace(3)*
  store float %81, float addrspace(3)* %83, align 4, !tbaa !7
  %84 = getelementptr inbounds float, float addrspace(1)* %4, i64 %79
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !7, !amdgpu.noclobber !5
  %86 = getelementptr inbounds i32, i32 addrspace(3)* %8, i32 %78
  %87 = bitcast i32 addrspace(3)* %86 to float addrspace(3)*
  store float %85, float addrspace(3)* %87, align 4, !tbaa !7
  %88 = or i32 %27, 6
  %89 = zext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %3, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !7, !amdgpu.noclobber !5
  %92 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %88
  %93 = bitcast i32 addrspace(3)* %92 to float addrspace(3)*
  store float %91, float addrspace(3)* %93, align 4, !tbaa !7
  %94 = getelementptr inbounds float, float addrspace(1)* %4, i64 %89
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7, !amdgpu.noclobber !5
  %96 = getelementptr inbounds i32, i32 addrspace(3)* %8, i32 %88
  %97 = bitcast i32 addrspace(3)* %96 to float addrspace(3)*
  store float %95, float addrspace(3)* %97, align 4, !tbaa !7
  %98 = or i32 %27, 7
  %99 = zext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %3, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !7, !amdgpu.noclobber !5
  %102 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %98
  %103 = bitcast i32 addrspace(3)* %102 to float addrspace(3)*
  store float %101, float addrspace(3)* %103, align 4, !tbaa !7
  %104 = getelementptr inbounds float, float addrspace(1)* %4, i64 %99
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !7, !amdgpu.noclobber !5
  %106 = getelementptr inbounds i32, i32 addrspace(3)* %8, i32 %98
  %107 = bitcast i32 addrspace(3)* %106 to float addrspace(3)*
  store float %105, float addrspace(3)* %107, align 4, !tbaa !7
  %108 = add nuw nsw i32 %27, 8
  %109 = add i32 %28, 8
  %110 = icmp eq i32 %109, %25
  br i1 %110, label %111, label %26, !llvm.loop !11

111:                                              ; preds = %26, %21
  %112 = phi i32 [ 0, %21 ], [ %108, %26 ]
  %113 = icmp eq i32 %22, 0
  br i1 %113, label %129, label %114

114:                                              ; preds = %111, %114
  %115 = phi i32 [ %126, %114 ], [ %112, %111 ]
  %116 = phi i32 [ %127, %114 ], [ 0, %111 ]
  %117 = zext i32 %115 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %3, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !7, !amdgpu.noclobber !5
  %120 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %115
  %121 = bitcast i32 addrspace(3)* %120 to float addrspace(3)*
  store float %119, float addrspace(3)* %121, align 4, !tbaa !7
  %122 = getelementptr inbounds float, float addrspace(1)* %4, i64 %117
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !7, !amdgpu.noclobber !5
  %124 = getelementptr inbounds i32, i32 addrspace(3)* %8, i32 %115
  %125 = bitcast i32 addrspace(3)* %124 to float addrspace(3)*
  store float %123, float addrspace(3)* %125, align 4, !tbaa !7
  %126 = add nuw nsw i32 %115, 1
  %127 = add i32 %116, 1
  %128 = icmp eq i32 %127, %22
  br i1 %128, label %129, label %114, !llvm.loop !13

129:                                              ; preds = %111, %114, %19
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %20, label %132, label %130

130:                                              ; preds = %129
  %131 = sext i32 %17 to i64
  br label %239

132:                                              ; preds = %129
  %133 = add nsw i32 %6, -1
  %134 = sext i32 %17 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %2, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !7, !amdgpu.noclobber !5
  %137 = getelementptr inbounds float, float addrspace(1)* %1, i64 %134
  %138 = getelementptr inbounds i32, i32 addrspace(3)* %8, i32 %133
  %139 = bitcast i32 addrspace(3)* %138 to float addrspace(3)*
  %140 = load float, float addrspace(3)* %139, align 4, !tbaa !7
  %141 = and i32 %6, 1
  %142 = icmp eq i32 %133, 0
  br i1 %142, label %207, label %143

143:                                              ; preds = %132
  %144 = and i32 %6, -2
  br label %145

145:                                              ; preds = %202, %143
  %146 = phi float [ %140, %143 ], [ %180, %202 ]
  %147 = phi i32 [ 0, %143 ], [ %203, %202 ]
  %148 = phi i32 [ %133, %143 ], [ %177, %202 ]
  %149 = phi i32 [ 0, %143 ], [ %204, %202 ]
  %150 = phi i32 [ 0, %143 ], [ %205, %202 ]
  %151 = getelementptr inbounds i32, i32 addrspace(3)* %8, i32 %149
  %152 = bitcast i32 addrspace(3)* %151 to float addrspace(3)*
  %153 = load float, float addrspace(3)* %152, align 4, !tbaa !7
  %154 = fcmp contract ule float %153, %136
  %155 = fcmp contract ogt float %146, %136
  %156 = xor i1 %154, %155
  br i1 %156, label %175, label %157

157:                                              ; preds = %145
  %158 = load float, float addrspace(1)* %137, align 4, !tbaa !7, !amdgpu.noclobber !5
  %159 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %148
  %160 = bitcast i32 addrspace(3)* %159 to float addrspace(3)*
  %161 = load float, float addrspace(3)* %160, align 4, !tbaa !7
  %162 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %149
  %163 = bitcast i32 addrspace(3)* %162 to float addrspace(3)*
  %164 = load float, float addrspace(3)* %163, align 4, !tbaa !7
  %165 = fsub contract float %161, %164
  %166 = fsub contract float %136, %153
  %167 = fmul contract float %166, %165
  %168 = fsub contract float %146, %153
  %169 = fdiv contract float %167, %168
  %170 = fadd contract float %164, %169
  %171 = fcmp contract olt float %158, %170
  %172 = icmp eq i32 %147, 0
  %173 = zext i1 %172 to i32
  %174 = select i1 %171, i32 %173, i32 %147
  br label %175

175:                                              ; preds = %157, %145
  %176 = phi i32 [ %147, %145 ], [ %174, %157 ]
  %177 = or i32 %149, 1
  %178 = getelementptr inbounds i32, i32 addrspace(3)* %8, i32 %177
  %179 = bitcast i32 addrspace(3)* %178 to float addrspace(3)*
  %180 = load float, float addrspace(3)* %179, align 4, !tbaa !7
  %181 = fcmp contract ule float %180, %136
  %182 = fcmp contract ogt float %153, %136
  %183 = xor i1 %181, %182
  br i1 %183, label %202, label %184

184:                                              ; preds = %175
  %185 = load float, float addrspace(1)* %137, align 4, !tbaa !7, !amdgpu.noclobber !5
  %186 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %149
  %187 = bitcast i32 addrspace(3)* %186 to float addrspace(3)*
  %188 = load float, float addrspace(3)* %187, align 4, !tbaa !7
  %189 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %177
  %190 = bitcast i32 addrspace(3)* %189 to float addrspace(3)*
  %191 = load float, float addrspace(3)* %190, align 4, !tbaa !7
  %192 = fsub contract float %188, %191
  %193 = fsub contract float %136, %180
  %194 = fmul contract float %193, %192
  %195 = fsub contract float %153, %180
  %196 = fdiv contract float %194, %195
  %197 = fadd contract float %191, %196
  %198 = fcmp contract olt float %185, %197
  %199 = icmp eq i32 %176, 0
  %200 = zext i1 %199 to i32
  %201 = select i1 %198, i32 %200, i32 %176
  br label %202

202:                                              ; preds = %184, %175
  %203 = phi i32 [ %176, %175 ], [ %201, %184 ]
  %204 = add nuw nsw i32 %149, 2
  %205 = add i32 %150, 2
  %206 = icmp eq i32 %205, %144
  br i1 %206, label %207, label %145, !llvm.loop !15

207:                                              ; preds = %202, %132
  %208 = phi i32 [ undef, %132 ], [ %203, %202 ]
  %209 = phi float [ %140, %132 ], [ %180, %202 ]
  %210 = phi i32 [ 0, %132 ], [ %203, %202 ]
  %211 = phi i32 [ %133, %132 ], [ %177, %202 ]
  %212 = phi i32 [ 0, %132 ], [ %204, %202 ]
  %213 = icmp eq i32 %141, 0
  br i1 %213, label %239, label %214

214:                                              ; preds = %207
  %215 = getelementptr inbounds i32, i32 addrspace(3)* %8, i32 %212
  %216 = bitcast i32 addrspace(3)* %215 to float addrspace(3)*
  %217 = load float, float addrspace(3)* %216, align 4, !tbaa !7
  %218 = fcmp contract ule float %217, %136
  %219 = fcmp contract ogt float %209, %136
  %220 = xor i1 %218, %219
  br i1 %220, label %239, label %221

221:                                              ; preds = %214
  %222 = load float, float addrspace(1)* %137, align 4, !tbaa !7, !amdgpu.noclobber !5
  %223 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %211
  %224 = bitcast i32 addrspace(3)* %223 to float addrspace(3)*
  %225 = load float, float addrspace(3)* %224, align 4, !tbaa !7
  %226 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %212
  %227 = bitcast i32 addrspace(3)* %226 to float addrspace(3)*
  %228 = load float, float addrspace(3)* %227, align 4, !tbaa !7
  %229 = fsub contract float %225, %228
  %230 = fsub contract float %136, %217
  %231 = fmul contract float %230, %229
  %232 = fsub contract float %209, %217
  %233 = fdiv contract float %231, %232
  %234 = fadd contract float %228, %233
  %235 = fcmp contract olt float %222, %234
  %236 = icmp eq i32 %210, 0
  %237 = zext i1 %236 to i32
  %238 = select i1 %235, i32 %237, i32 %210
  br label %239

239:                                              ; preds = %207, %221, %214, %130
  %240 = phi i64 [ %131, %130 ], [ %134, %214 ], [ %134, %221 ], [ %134, %207 ]
  %241 = phi i32 [ 0, %130 ], [ %208, %207 ], [ %210, %214 ], [ %238, %221 ]
  %242 = trunc i32 %241 to i8
  %243 = and i8 %242, 1
  %244 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %240
  store i8 %243, i8 addrspace(1)* %244, align 1, !tbaa !16
  br label %245

245:                                              ; preds = %239, %7
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
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !12}
!16 = !{!9, !9, i64 0}
