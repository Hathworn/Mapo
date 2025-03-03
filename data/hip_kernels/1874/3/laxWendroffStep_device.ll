; ModuleID = '../data/hip_kernels/1874/3/main.cu'
source_filename = "../data/hip_kernels/1874/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15laxWendroffStepiPdS_S_S_S_S_S_S_S_PKdS1_S1_(i32 %0, double addrspace(1)* nocapture %1, double addrspace(1)* nocapture %2, double addrspace(1)* nocapture %3, double addrspace(1)* nocapture %4, double addrspace(1)* nocapture %5, double addrspace(1)* nocapture %6, double addrspace(1)* nocapture %7, double addrspace(1)* nocapture %8, double addrspace(1)* nocapture %9, double addrspace(1)* nocapture readonly %10, double addrspace(1)* nocapture readonly %11, double addrspace(1)* nocapture readonly %12) local_unnamed_addr #0 {
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %14, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %22 = add i32 %20, %21
  %23 = icmp slt i32 %22, %0
  br i1 %23, label %24, label %117

24:                                               ; preds = %13, %24
  %25 = phi i32 [ %47, %24 ], [ %22, %13 ]
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds double, double addrspace(1)* %1, i64 %26
  %28 = load double, double addrspace(1)* %27, align 8, !tbaa !7
  %29 = getelementptr inbounds double, double addrspace(1)* %2, i64 %26
  %30 = load double, double addrspace(1)* %29, align 8, !tbaa !7
  %31 = getelementptr inbounds double, double addrspace(1)* %3, i64 %26
  %32 = load double, double addrspace(1)* %31, align 8, !tbaa !7
  %33 = load double, double addrspace(1)* %12, align 8, !tbaa !7
  %34 = fadd contract double %33, -1.000000e+00
  %35 = fmul contract double %30, %30
  %36 = fdiv contract double %35, %28
  %37 = fmul contract double %36, 5.000000e-01
  %38 = fsub contract double %32, %37
  %39 = fmul contract double %34, %38
  %40 = getelementptr inbounds double, double addrspace(1)* %7, i64 %26
  store double %30, double addrspace(1)* %40, align 8, !tbaa !7
  %41 = fadd contract double %36, %39
  %42 = getelementptr inbounds double, double addrspace(1)* %8, i64 %26
  store double %41, double addrspace(1)* %42, align 8, !tbaa !7
  %43 = fdiv contract double %30, %28
  %44 = fadd contract double %32, %39
  %45 = fmul contract double %43, %44
  %46 = getelementptr inbounds double, double addrspace(1)* %9, i64 %26
  store double %45, double addrspace(1)* %46, align 8, !tbaa !7
  %47 = add nsw i32 %25, %19
  %48 = icmp slt i32 %47, %0
  br i1 %48, label %24, label %49, !llvm.loop !11

49:                                               ; preds = %24
  %50 = add nsw i32 %0, -1
  br label %51

51:                                               ; preds = %114, %49
  %52 = phi i32 [ %22, %49 ], [ %115, %114 ]
  %53 = icmp sgt i32 %52, 0
  %54 = icmp slt i32 %52, %50
  %55 = select i1 %53, i1 %54, i1 false
  br i1 %55, label %56, label %114

56:                                               ; preds = %51
  %57 = add nuw nsw i32 %52, 1
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds double, double addrspace(1)* %1, i64 %58
  %60 = load double, double addrspace(1)* %59, align 8, !tbaa !7
  %61 = zext i32 %52 to i64
  %62 = getelementptr inbounds double, double addrspace(1)* %1, i64 %61
  %63 = load double, double addrspace(1)* %62, align 8, !tbaa !7
  %64 = fadd contract double %60, %63
  %65 = fmul contract double %64, 5.000000e-01
  %66 = load double, double addrspace(1)* %10, align 8, !tbaa !7
  %67 = fmul contract double %66, 5.000000e-01
  %68 = load double, double addrspace(1)* %11, align 8, !tbaa !7
  %69 = fdiv contract double %67, %68
  %70 = getelementptr inbounds double, double addrspace(1)* %7, i64 %58
  %71 = load double, double addrspace(1)* %70, align 8, !tbaa !7
  %72 = getelementptr inbounds double, double addrspace(1)* %7, i64 %61
  %73 = load double, double addrspace(1)* %72, align 8, !tbaa !7
  %74 = fsub contract double %71, %73
  %75 = fmul contract double %69, %74
  %76 = fsub contract double %65, %75
  %77 = getelementptr inbounds double, double addrspace(1)* %4, i64 %61
  store double %76, double addrspace(1)* %77, align 8, !tbaa !7
  %78 = getelementptr inbounds double, double addrspace(1)* %2, i64 %58
  %79 = load double, double addrspace(1)* %78, align 8, !tbaa !7
  %80 = getelementptr inbounds double, double addrspace(1)* %2, i64 %61
  %81 = load double, double addrspace(1)* %80, align 8, !tbaa !7
  %82 = fadd contract double %79, %81
  %83 = fmul contract double %82, 5.000000e-01
  %84 = load double, double addrspace(1)* %10, align 8, !tbaa !7
  %85 = fmul contract double %84, 5.000000e-01
  %86 = load double, double addrspace(1)* %11, align 8, !tbaa !7
  %87 = fdiv contract double %85, %86
  %88 = getelementptr inbounds double, double addrspace(1)* %8, i64 %58
  %89 = load double, double addrspace(1)* %88, align 8, !tbaa !7
  %90 = getelementptr inbounds double, double addrspace(1)* %8, i64 %61
  %91 = load double, double addrspace(1)* %90, align 8, !tbaa !7
  %92 = fsub contract double %89, %91
  %93 = fmul contract double %87, %92
  %94 = fsub contract double %83, %93
  %95 = getelementptr inbounds double, double addrspace(1)* %5, i64 %61
  store double %94, double addrspace(1)* %95, align 8, !tbaa !7
  %96 = getelementptr inbounds double, double addrspace(1)* %3, i64 %58
  %97 = load double, double addrspace(1)* %96, align 8, !tbaa !7
  %98 = getelementptr inbounds double, double addrspace(1)* %3, i64 %61
  %99 = load double, double addrspace(1)* %98, align 8, !tbaa !7
  %100 = fadd contract double %97, %99
  %101 = fmul contract double %100, 5.000000e-01
  %102 = load double, double addrspace(1)* %10, align 8, !tbaa !7
  %103 = fmul contract double %102, 5.000000e-01
  %104 = load double, double addrspace(1)* %11, align 8, !tbaa !7
  %105 = fdiv contract double %103, %104
  %106 = getelementptr inbounds double, double addrspace(1)* %9, i64 %58
  %107 = load double, double addrspace(1)* %106, align 8, !tbaa !7
  %108 = getelementptr inbounds double, double addrspace(1)* %9, i64 %61
  %109 = load double, double addrspace(1)* %108, align 8, !tbaa !7
  %110 = fsub contract double %107, %109
  %111 = fmul contract double %105, %110
  %112 = fsub contract double %101, %111
  %113 = getelementptr inbounds double, double addrspace(1)* %6, i64 %61
  store double %112, double addrspace(1)* %113, align 8, !tbaa !7
  br label %114

114:                                              ; preds = %56, %51
  %115 = add nsw i32 %52, %19
  %116 = icmp slt i32 %115, %0
  br i1 %116, label %51, label %117, !llvm.loop !13

117:                                              ; preds = %114, %13
  %118 = getelementptr inbounds double, double addrspace(1)* %4, i64 1
  %119 = load double, double addrspace(1)* %118, align 8, !tbaa !7
  store double %119, double addrspace(1)* %4, align 8, !tbaa !7
  %120 = getelementptr inbounds double, double addrspace(1)* %5, i64 1
  %121 = load double, double addrspace(1)* %120, align 8, !tbaa !7
  %122 = fneg contract double %121
  store double %122, double addrspace(1)* %5, align 8, !tbaa !7
  %123 = getelementptr inbounds double, double addrspace(1)* %6, i64 1
  %124 = load double, double addrspace(1)* %123, align 8, !tbaa !7
  store double %124, double addrspace(1)* %6, align 8, !tbaa !7
  %125 = add nsw i32 %0, -2
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds double, double addrspace(1)* %4, i64 %126
  %128 = load double, double addrspace(1)* %127, align 8, !tbaa !7
  %129 = add nsw i32 %0, -1
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds double, double addrspace(1)* %4, i64 %130
  store double %128, double addrspace(1)* %131, align 8, !tbaa !7
  %132 = getelementptr inbounds double, double addrspace(1)* %5, i64 %126
  %133 = load double, double addrspace(1)* %132, align 8, !tbaa !7
  %134 = fneg contract double %133
  %135 = getelementptr inbounds double, double addrspace(1)* %5, i64 %130
  store double %134, double addrspace(1)* %135, align 8, !tbaa !7
  %136 = getelementptr inbounds double, double addrspace(1)* %6, i64 %126
  %137 = load double, double addrspace(1)* %136, align 8, !tbaa !7
  %138 = getelementptr inbounds double, double addrspace(1)* %6, i64 %130
  store double %137, double addrspace(1)* %138, align 8, !tbaa !7
  br i1 %23, label %139, label %234

139:                                              ; preds = %117, %139
  %140 = phi i32 [ %162, %139 ], [ %22, %117 ]
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds double, double addrspace(1)* %4, i64 %141
  %143 = load double, double addrspace(1)* %142, align 8, !tbaa !7
  %144 = getelementptr inbounds double, double addrspace(1)* %5, i64 %141
  %145 = load double, double addrspace(1)* %144, align 8, !tbaa !7
  %146 = getelementptr inbounds double, double addrspace(1)* %6, i64 %141
  %147 = load double, double addrspace(1)* %146, align 8, !tbaa !7
  %148 = load double, double addrspace(1)* %12, align 8, !tbaa !7
  %149 = fadd contract double %148, -1.000000e+00
  %150 = fmul contract double %145, %145
  %151 = fdiv contract double %150, %143
  %152 = fmul contract double %151, 5.000000e-01
  %153 = fsub contract double %147, %152
  %154 = fmul contract double %149, %153
  %155 = getelementptr inbounds double, double addrspace(1)* %7, i64 %141
  store double %145, double addrspace(1)* %155, align 8, !tbaa !7
  %156 = fadd contract double %151, %154
  %157 = getelementptr inbounds double, double addrspace(1)* %8, i64 %141
  store double %156, double addrspace(1)* %157, align 8, !tbaa !7
  %158 = fdiv contract double %145, %143
  %159 = fadd contract double %147, %154
  %160 = fmul contract double %158, %159
  %161 = getelementptr inbounds double, double addrspace(1)* %9, i64 %141
  store double %160, double addrspace(1)* %161, align 8, !tbaa !7
  %162 = add nsw i32 %140, %19
  %163 = icmp slt i32 %162, %0
  br i1 %163, label %139, label %164, !llvm.loop !11

164:                                              ; preds = %139, %212
  %165 = phi i32 [ %213, %212 ], [ %22, %139 ]
  %166 = icmp sgt i32 %165, 0
  %167 = icmp slt i32 %165, %129
  %168 = select i1 %166, i1 %167, i1 false
  br i1 %168, label %169, label %212

169:                                              ; preds = %164
  %170 = zext i32 %165 to i64
  %171 = getelementptr inbounds double, double addrspace(1)* %1, i64 %170
  %172 = load double, double addrspace(1)* %171, align 8, !tbaa !7
  %173 = load double, double addrspace(1)* %10, align 8, !tbaa !7
  %174 = load double, double addrspace(1)* %11, align 8, !tbaa !7
  %175 = fdiv contract double %173, %174
  %176 = getelementptr inbounds double, double addrspace(1)* %7, i64 %170
  %177 = load double, double addrspace(1)* %176, align 8, !tbaa !7
  %178 = add nsw i32 %165, -1
  %179 = zext i32 %178 to i64
  %180 = getelementptr inbounds double, double addrspace(1)* %7, i64 %179
  %181 = load double, double addrspace(1)* %180, align 8, !tbaa !7
  %182 = fsub contract double %177, %181
  %183 = fmul contract double %175, %182
  %184 = fsub contract double %172, %183
  %185 = getelementptr inbounds double, double addrspace(1)* %4, i64 %170
  store double %184, double addrspace(1)* %185, align 8, !tbaa !7
  %186 = getelementptr inbounds double, double addrspace(1)* %2, i64 %170
  %187 = load double, double addrspace(1)* %186, align 8, !tbaa !7
  %188 = load double, double addrspace(1)* %10, align 8, !tbaa !7
  %189 = load double, double addrspace(1)* %11, align 8, !tbaa !7
  %190 = fdiv contract double %188, %189
  %191 = getelementptr inbounds double, double addrspace(1)* %8, i64 %170
  %192 = load double, double addrspace(1)* %191, align 8, !tbaa !7
  %193 = getelementptr inbounds double, double addrspace(1)* %8, i64 %179
  %194 = load double, double addrspace(1)* %193, align 8, !tbaa !7
  %195 = fsub contract double %192, %194
  %196 = fmul contract double %190, %195
  %197 = fsub contract double %187, %196
  %198 = getelementptr inbounds double, double addrspace(1)* %5, i64 %170
  store double %197, double addrspace(1)* %198, align 8, !tbaa !7
  %199 = getelementptr inbounds double, double addrspace(1)* %3, i64 %170
  %200 = load double, double addrspace(1)* %199, align 8, !tbaa !7
  %201 = load double, double addrspace(1)* %10, align 8, !tbaa !7
  %202 = load double, double addrspace(1)* %11, align 8, !tbaa !7
  %203 = fdiv contract double %201, %202
  %204 = getelementptr inbounds double, double addrspace(1)* %9, i64 %170
  %205 = load double, double addrspace(1)* %204, align 8, !tbaa !7
  %206 = getelementptr inbounds double, double addrspace(1)* %9, i64 %179
  %207 = load double, double addrspace(1)* %206, align 8, !tbaa !7
  %208 = fsub contract double %205, %207
  %209 = fmul contract double %203, %208
  %210 = fsub contract double %200, %209
  %211 = getelementptr inbounds double, double addrspace(1)* %6, i64 %170
  store double %210, double addrspace(1)* %211, align 8, !tbaa !7
  br label %212

212:                                              ; preds = %169, %164
  %213 = add nsw i32 %165, %19
  %214 = icmp slt i32 %213, %0
  br i1 %214, label %164, label %215, !llvm.loop !14

215:                                              ; preds = %212, %231
  %216 = phi i32 [ %232, %231 ], [ %22, %212 ]
  %217 = icmp sgt i32 %216, 0
  %218 = icmp slt i32 %216, %129
  %219 = select i1 %217, i1 %218, i1 false
  br i1 %219, label %220, label %231

220:                                              ; preds = %215
  %221 = zext i32 %216 to i64
  %222 = getelementptr inbounds double, double addrspace(1)* %4, i64 %221
  %223 = load double, double addrspace(1)* %222, align 8, !tbaa !7
  %224 = getelementptr inbounds double, double addrspace(1)* %1, i64 %221
  store double %223, double addrspace(1)* %224, align 8, !tbaa !7
  %225 = getelementptr inbounds double, double addrspace(1)* %5, i64 %221
  %226 = load double, double addrspace(1)* %225, align 8, !tbaa !7
  %227 = getelementptr inbounds double, double addrspace(1)* %2, i64 %221
  store double %226, double addrspace(1)* %227, align 8, !tbaa !7
  %228 = getelementptr inbounds double, double addrspace(1)* %6, i64 %221
  %229 = load double, double addrspace(1)* %228, align 8, !tbaa !7
  %230 = getelementptr inbounds double, double addrspace(1)* %3, i64 %221
  store double %229, double addrspace(1)* %230, align 8, !tbaa !7
  br label %231

231:                                              ; preds = %220, %215
  %232 = add nsw i32 %216, %19
  %233 = icmp slt i32 %232, %0
  br i1 %233, label %215, label %234, !llvm.loop !15

234:                                              ; preds = %231, %117
  %235 = getelementptr inbounds double, double addrspace(1)* %1, i64 1
  %236 = load double, double addrspace(1)* %235, align 8, !tbaa !7
  store double %236, double addrspace(1)* %1, align 8, !tbaa !7
  %237 = getelementptr inbounds double, double addrspace(1)* %2, i64 1
  %238 = load double, double addrspace(1)* %237, align 8, !tbaa !7
  %239 = fneg contract double %238
  store double %239, double addrspace(1)* %2, align 8, !tbaa !7
  %240 = getelementptr inbounds double, double addrspace(1)* %3, i64 1
  %241 = load double, double addrspace(1)* %240, align 8, !tbaa !7
  store double %241, double addrspace(1)* %3, align 8, !tbaa !7
  %242 = getelementptr inbounds double, double addrspace(1)* %1, i64 %126
  %243 = load double, double addrspace(1)* %242, align 8, !tbaa !7
  %244 = getelementptr inbounds double, double addrspace(1)* %1, i64 %130
  store double %243, double addrspace(1)* %244, align 8, !tbaa !7
  %245 = getelementptr inbounds double, double addrspace(1)* %2, i64 %126
  %246 = load double, double addrspace(1)* %245, align 8, !tbaa !7
  %247 = fneg contract double %246
  %248 = getelementptr inbounds double, double addrspace(1)* %2, i64 %130
  store double %247, double addrspace(1)* %248, align 8, !tbaa !7
  %249 = getelementptr inbounds double, double addrspace(1)* %3, i64 %126
  %250 = load double, double addrspace(1)* %249, align 8, !tbaa !7
  %251 = getelementptr inbounds double, double addrspace(1)* %3, i64 %130
  store double %250, double addrspace(1)* %251, align 8, !tbaa !7
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
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !12}
