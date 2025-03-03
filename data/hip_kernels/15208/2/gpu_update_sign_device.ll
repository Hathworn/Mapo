; ModuleID = '../data/hip_kernels/15208/2/main.cu'
source_filename = "../data/hip_kernels/15208/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15gpu_update_signPiPdS_iiS_S_ii(i32 addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 addrspace(1)* nocapture writeonly %5, i32 addrspace(1)* nocapture %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = icmp sgt i32 %7, 0
  br i1 %10, label %11, label %42

11:                                               ; preds = %9
  %12 = icmp sgt i32 %8, 0
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %14, i64 12
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %20 = icmp sgt i32 %3, 0
  %21 = mul i32 %3, %3
  %22 = and i32 %3, 7
  %23 = icmp ult i32 %3, 8
  %24 = and i32 %3, -8
  %25 = icmp eq i32 %22, 0
  br label %26

26:                                               ; preds = %11, %46
  %27 = phi i32 [ 0, %11 ], [ %47, %46 ]
  %28 = phi i32 [ 0, %11 ], [ %48, %46 ]
  br i1 %12, label %29, label %46

29:                                               ; preds = %26
  %30 = load i32, i32 addrspace(4)* %16, align 4, !tbaa !4
  %31 = load i16, i16 addrspace(4)* %18, align 4, !range !13, !invariant.load !14
  %32 = zext i16 %31 to i32
  %33 = udiv i32 %30, %32
  %34 = mul i32 %33, %32
  %35 = icmp ugt i32 %30, %34
  %36 = zext i1 %35 to i32
  %37 = add i32 %33, %36
  %38 = mul i32 %37, %28
  %39 = add i32 %38, %13
  %40 = icmp slt i32 %39, %4
  %41 = mul nsw i32 %39, %4
  br label %50

42:                                               ; preds = %46, %9
  %43 = phi i32 [ 0, %9 ], [ %47, %46 ]
  %44 = load i32, i32 addrspace(1)* %6, align 4, !tbaa !15
  %45 = add nsw i32 %44, %43
  store i32 %45, i32 addrspace(1)* %6, align 4, !tbaa !15
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void

46:                                               ; preds = %257, %26
  %47 = phi i32 [ %27, %26 ], [ %258, %257 ]
  %48 = add nuw nsw i32 %28, 1
  %49 = icmp eq i32 %48, %7
  br i1 %49, label %42, label %26, !llvm.loop !19

50:                                               ; preds = %29, %257
  %51 = phi i32 [ %27, %29 ], [ %258, %257 ]
  %52 = phi i32 [ 0, %29 ], [ %259, %257 ]
  %53 = mul i32 %52, %32
  %54 = add i32 %53, %19
  %55 = icmp slt i32 %54, %4
  %56 = select i1 %40, i1 %55, i1 false
  br i1 %56, label %57, label %257

57:                                               ; preds = %50
  br i1 %20, label %58, label %65

58:                                               ; preds = %57
  %59 = add i32 %41, %54
  %60 = mul i32 %21, %59
  br label %61

61:                                               ; preds = %58, %93
  %62 = phi i32 [ 0, %58 ], [ %95, %93 ]
  %63 = phi double [ 0.000000e+00, %58 ], [ %94, %93 ]
  %64 = mul nsw i32 %62, %3
  br i1 %23, label %68, label %97

65:                                               ; preds = %93, %57
  %66 = phi double [ 0.000000e+00, %57 ], [ %94, %93 ]
  %67 = fcmp contract ogt double %66, 0x3EB0C6F7A0B5ED8D
  br i1 %67, label %223, label %236

68:                                               ; preds = %97, %61
  %69 = phi double [ undef, %61 ], [ %219, %97 ]
  %70 = phi i32 [ 0, %61 ], [ %220, %97 ]
  %71 = phi double [ %63, %61 ], [ %219, %97 ]
  br i1 %25, label %93, label %72

72:                                               ; preds = %68, %72
  %73 = phi i32 [ %90, %72 ], [ %70, %68 ]
  %74 = phi double [ %89, %72 ], [ %71, %68 ]
  %75 = phi i32 [ %91, %72 ], [ 0, %68 ]
  %76 = add i32 %73, %64
  %77 = add i32 %76, %60
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %78
  %80 = load i32, i32 addrspace(1)* %79, align 4, !tbaa !15
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %81
  %83 = load i32, i32 addrspace(1)* %82, align 4, !tbaa !15
  %84 = sitofp i32 %83 to double
  %85 = sext i32 %76 to i64
  %86 = getelementptr inbounds double, double addrspace(1)* %1, i64 %85
  %87 = load double, double addrspace(1)* %86, align 8, !tbaa !21, !amdgpu.noclobber !14
  %88 = fmul contract double %87, %84
  %89 = fadd contract double %74, %88
  %90 = add nuw nsw i32 %73, 1
  %91 = add i32 %75, 1
  %92 = icmp eq i32 %91, %22
  br i1 %92, label %93, label %72, !llvm.loop !23

93:                                               ; preds = %72, %68
  %94 = phi double [ %69, %68 ], [ %89, %72 ]
  %95 = add nuw nsw i32 %62, 1
  %96 = icmp eq i32 %95, %3
  br i1 %96, label %65, label %61, !llvm.loop !25

97:                                               ; preds = %61, %97
  %98 = phi i32 [ %220, %97 ], [ 0, %61 ]
  %99 = phi double [ %219, %97 ], [ %63, %61 ]
  %100 = phi i32 [ %221, %97 ], [ 0, %61 ]
  %101 = add i32 %98, %64
  %102 = add i32 %101, %60
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %103
  %105 = load i32, i32 addrspace(1)* %104, align 4, !tbaa !15
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %106
  %108 = load i32, i32 addrspace(1)* %107, align 4, !tbaa !15
  %109 = sitofp i32 %108 to double
  %110 = sext i32 %101 to i64
  %111 = getelementptr inbounds double, double addrspace(1)* %1, i64 %110
  %112 = load double, double addrspace(1)* %111, align 8, !tbaa !21, !amdgpu.noclobber !14
  %113 = fmul contract double %112, %109
  %114 = fadd contract double %99, %113
  %115 = or i32 %98, 1
  %116 = add i32 %115, %64
  %117 = add i32 %116, %60
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %118
  %120 = load i32, i32 addrspace(1)* %119, align 4, !tbaa !15
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %121
  %123 = load i32, i32 addrspace(1)* %122, align 4, !tbaa !15
  %124 = sitofp i32 %123 to double
  %125 = sext i32 %116 to i64
  %126 = getelementptr inbounds double, double addrspace(1)* %1, i64 %125
  %127 = load double, double addrspace(1)* %126, align 8, !tbaa !21, !amdgpu.noclobber !14
  %128 = fmul contract double %127, %124
  %129 = fadd contract double %114, %128
  %130 = or i32 %98, 2
  %131 = add i32 %130, %64
  %132 = add i32 %131, %60
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %133
  %135 = load i32, i32 addrspace(1)* %134, align 4, !tbaa !15
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %136
  %138 = load i32, i32 addrspace(1)* %137, align 4, !tbaa !15
  %139 = sitofp i32 %138 to double
  %140 = sext i32 %131 to i64
  %141 = getelementptr inbounds double, double addrspace(1)* %1, i64 %140
  %142 = load double, double addrspace(1)* %141, align 8, !tbaa !21, !amdgpu.noclobber !14
  %143 = fmul contract double %142, %139
  %144 = fadd contract double %129, %143
  %145 = or i32 %98, 3
  %146 = add i32 %145, %64
  %147 = add i32 %146, %60
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %148
  %150 = load i32, i32 addrspace(1)* %149, align 4, !tbaa !15
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %151
  %153 = load i32, i32 addrspace(1)* %152, align 4, !tbaa !15
  %154 = sitofp i32 %153 to double
  %155 = sext i32 %146 to i64
  %156 = getelementptr inbounds double, double addrspace(1)* %1, i64 %155
  %157 = load double, double addrspace(1)* %156, align 8, !tbaa !21, !amdgpu.noclobber !14
  %158 = fmul contract double %157, %154
  %159 = fadd contract double %144, %158
  %160 = or i32 %98, 4
  %161 = add i32 %160, %64
  %162 = add i32 %161, %60
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %163
  %165 = load i32, i32 addrspace(1)* %164, align 4, !tbaa !15
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %166
  %168 = load i32, i32 addrspace(1)* %167, align 4, !tbaa !15
  %169 = sitofp i32 %168 to double
  %170 = sext i32 %161 to i64
  %171 = getelementptr inbounds double, double addrspace(1)* %1, i64 %170
  %172 = load double, double addrspace(1)* %171, align 8, !tbaa !21, !amdgpu.noclobber !14
  %173 = fmul contract double %172, %169
  %174 = fadd contract double %159, %173
  %175 = or i32 %98, 5
  %176 = add i32 %175, %64
  %177 = add i32 %176, %60
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %178
  %180 = load i32, i32 addrspace(1)* %179, align 4, !tbaa !15
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %181
  %183 = load i32, i32 addrspace(1)* %182, align 4, !tbaa !15
  %184 = sitofp i32 %183 to double
  %185 = sext i32 %176 to i64
  %186 = getelementptr inbounds double, double addrspace(1)* %1, i64 %185
  %187 = load double, double addrspace(1)* %186, align 8, !tbaa !21, !amdgpu.noclobber !14
  %188 = fmul contract double %187, %184
  %189 = fadd contract double %174, %188
  %190 = or i32 %98, 6
  %191 = add i32 %190, %64
  %192 = add i32 %191, %60
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %193
  %195 = load i32, i32 addrspace(1)* %194, align 4, !tbaa !15
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %196
  %198 = load i32, i32 addrspace(1)* %197, align 4, !tbaa !15
  %199 = sitofp i32 %198 to double
  %200 = sext i32 %191 to i64
  %201 = getelementptr inbounds double, double addrspace(1)* %1, i64 %200
  %202 = load double, double addrspace(1)* %201, align 8, !tbaa !21, !amdgpu.noclobber !14
  %203 = fmul contract double %202, %199
  %204 = fadd contract double %189, %203
  %205 = or i32 %98, 7
  %206 = add i32 %205, %64
  %207 = add i32 %206, %60
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %208
  %210 = load i32, i32 addrspace(1)* %209, align 4, !tbaa !15
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %211
  %213 = load i32, i32 addrspace(1)* %212, align 4, !tbaa !15
  %214 = sitofp i32 %213 to double
  %215 = sext i32 %206 to i64
  %216 = getelementptr inbounds double, double addrspace(1)* %1, i64 %215
  %217 = load double, double addrspace(1)* %216, align 8, !tbaa !21, !amdgpu.noclobber !14
  %218 = fmul contract double %217, %214
  %219 = fadd contract double %204, %218
  %220 = add nuw nsw i32 %98, 8
  %221 = add i32 %100, 8
  %222 = icmp eq i32 %221, %24
  br i1 %222, label %68, label %97, !llvm.loop !26

223:                                              ; preds = %65
  %224 = add i32 %41, %54
  %225 = mul i32 %21, %224
  %226 = add nsw i32 %225, 12
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %227
  %229 = load i32, i32 addrspace(1)* %228, align 4, !tbaa !15
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %230
  %232 = load i32, i32 addrspace(1)* %231, align 4, !tbaa !15
  %233 = icmp ne i32 %232, 1
  %234 = zext i1 %233 to i32
  %235 = add nsw i32 %51, %234
  br label %251

236:                                              ; preds = %65
  %237 = fcmp contract olt double %66, 0xBEB0C6F7A0B5ED8D
  %238 = add i32 %41, %54
  %239 = mul i32 %21, %238
  %240 = add nsw i32 %239, 12
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %241
  %243 = load i32, i32 addrspace(1)* %242, align 4, !tbaa !15
  %244 = sext i32 %243 to i64
  %245 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %244
  %246 = load i32, i32 addrspace(1)* %245, align 4, !tbaa !15
  br i1 %237, label %247, label %251

247:                                              ; preds = %236
  %248 = icmp ne i32 %246, -1
  %249 = zext i1 %248 to i32
  %250 = add nsw i32 %51, %249
  br label %251

251:                                              ; preds = %236, %247, %223
  %252 = phi i32 [ %238, %247 ], [ %224, %223 ], [ %238, %236 ]
  %253 = phi i32 [ -1, %247 ], [ 1, %223 ], [ %246, %236 ]
  %254 = phi i32 [ %250, %247 ], [ %235, %223 ], [ %51, %236 ]
  %255 = sext i32 %252 to i64
  %256 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %255
  store i32 %253, i32 addrspace(1)* %256, align 4, !tbaa !15
  br label %257

257:                                              ; preds = %251, %50
  %258 = phi i32 [ %254, %251 ], [ %51, %50 ]
  %259 = add nuw nsw i32 %52, 1
  %260 = icmp eq i32 %259, %8
  br i1 %260, label %46, label %50, !llvm.loop !27
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{!16, !16, i64 0}
!16 = !{!"int", !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.mustprogress"}
!21 = !{!22, !22, i64 0}
!22 = !{!"double", !17, i64 0}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.unroll.disable"}
!25 = distinct !{!25, !20}
!26 = distinct !{!26, !20}
!27 = distinct !{!27, !20}
