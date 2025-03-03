; ModuleID = '../data/hip_kernels/2922/1/main.cu'
source_filename = "../data/hip_kernels/2922/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.point2 = type { double, double }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9pi_doublePK6point2Piif(%struct.point2 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, float %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = shl nuw nsw i32 %9, 5
  %12 = mul i32 %11, %10
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = sub i32 %2, %11
  %16 = icmp ult i32 %14, %15
  %17 = icmp slt i32 %14, %15
  %18 = and i1 %16, %17
  br i1 %18, label %19, label %248

19:                                               ; preds = %4
  %20 = fpext float %3 to double
  br label %21

21:                                               ; preds = %21, %19
  %22 = phi i32 [ 0, %19 ], [ %246, %21 ]
  %23 = mul nuw nsw i32 %22, %9
  %24 = add i32 %23, %14
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds %struct.point2, %struct.point2 addrspace(1)* %0, i64 %25, i32 0
  %27 = load double, double addrspace(1)* %26, align 8, !tbaa !7, !amdgpu.noclobber !5
  %28 = fmul contract double %27, %27
  %29 = getelementptr inbounds %struct.point2, %struct.point2 addrspace(1)* %0, i64 %25, i32 1
  %30 = load double, double addrspace(1)* %29, align 8, !tbaa !12, !amdgpu.noclobber !5
  %31 = fmul contract double %30, %30
  %32 = fadd contract double %28, %31
  %33 = fcmp contract ole double %32, %20
  %34 = zext i1 %33 to i32
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %25
  store i32 %34, i32 addrspace(1)* %35, align 4, !tbaa !13
  %36 = or i32 %22, 1
  %37 = mul nuw nsw i32 %36, %9
  %38 = add i32 %37, %14
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds %struct.point2, %struct.point2 addrspace(1)* %0, i64 %39, i32 0
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !7, !amdgpu.noclobber !5
  %42 = fmul contract double %41, %41
  %43 = getelementptr inbounds %struct.point2, %struct.point2 addrspace(1)* %0, i64 %39, i32 1
  %44 = load double, double addrspace(1)* %43, align 8, !tbaa !12, !amdgpu.noclobber !5
  %45 = fmul contract double %44, %44
  %46 = fadd contract double %42, %45
  %47 = fcmp contract ole double %46, %20
  %48 = zext i1 %47 to i32
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %39
  store i32 %48, i32 addrspace(1)* %49, align 4, !tbaa !13
  %50 = or i32 %22, 2
  %51 = mul nuw nsw i32 %50, %9
  %52 = add i32 %51, %14
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds %struct.point2, %struct.point2 addrspace(1)* %0, i64 %53, i32 0
  %55 = load double, double addrspace(1)* %54, align 8, !tbaa !7, !amdgpu.noclobber !5
  %56 = fmul contract double %55, %55
  %57 = getelementptr inbounds %struct.point2, %struct.point2 addrspace(1)* %0, i64 %53, i32 1
  %58 = load double, double addrspace(1)* %57, align 8, !tbaa !12, !amdgpu.noclobber !5
  %59 = fmul contract double %58, %58
  %60 = fadd contract double %56, %59
  %61 = fcmp contract ole double %60, %20
  %62 = zext i1 %61 to i32
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %53
  store i32 %62, i32 addrspace(1)* %63, align 4, !tbaa !13
  %64 = or i32 %22, 3
  %65 = mul nuw nsw i32 %64, %9
  %66 = add i32 %65, %14
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds %struct.point2, %struct.point2 addrspace(1)* %0, i64 %67, i32 0
  %69 = load double, double addrspace(1)* %68, align 8, !tbaa !7, !amdgpu.noclobber !5
  %70 = fmul contract double %69, %69
  %71 = getelementptr inbounds %struct.point2, %struct.point2 addrspace(1)* %0, i64 %67, i32 1
  %72 = load double, double addrspace(1)* %71, align 8, !tbaa !12, !amdgpu.noclobber !5
  %73 = fmul contract double %72, %72
  %74 = fadd contract double %70, %73
  %75 = fcmp contract ole double %74, %20
  %76 = zext i1 %75 to i32
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %67
  store i32 %76, i32 addrspace(1)* %77, align 4, !tbaa !13
  %78 = or i32 %22, 4
  %79 = mul nuw nsw i32 %78, %9
  %80 = add i32 %79, %14
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds %struct.point2, %struct.point2 addrspace(1)* %0, i64 %81, i32 0
  %83 = load double, double addrspace(1)* %82, align 8, !tbaa !7, !amdgpu.noclobber !5
  %84 = fmul contract double %83, %83
  %85 = getelementptr inbounds %struct.point2, %struct.point2 addrspace(1)* %0, i64 %81, i32 1
  %86 = load double, double addrspace(1)* %85, align 8, !tbaa !12, !amdgpu.noclobber !5
  %87 = fmul contract double %86, %86
  %88 = fadd contract double %84, %87
  %89 = fcmp contract ole double %88, %20
  %90 = zext i1 %89 to i32
  %91 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %81
  store i32 %90, i32 addrspace(1)* %91, align 4, !tbaa !13
  %92 = or i32 %22, 5
  %93 = mul nuw nsw i32 %92, %9
  %94 = add i32 %93, %14
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds %struct.point2, %struct.point2 addrspace(1)* %0, i64 %95, i32 0
  %97 = load double, double addrspace(1)* %96, align 8, !tbaa !7, !amdgpu.noclobber !5
  %98 = fmul contract double %97, %97
  %99 = getelementptr inbounds %struct.point2, %struct.point2 addrspace(1)* %0, i64 %95, i32 1
  %100 = load double, double addrspace(1)* %99, align 8, !tbaa !12, !amdgpu.noclobber !5
  %101 = fmul contract double %100, %100
  %102 = fadd contract double %98, %101
  %103 = fcmp contract ole double %102, %20
  %104 = zext i1 %103 to i32
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %95
  store i32 %104, i32 addrspace(1)* %105, align 4, !tbaa !13
  %106 = or i32 %22, 6
  %107 = mul nuw nsw i32 %106, %9
  %108 = add i32 %107, %14
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds %struct.point2, %struct.point2 addrspace(1)* %0, i64 %109, i32 0
  %111 = load double, double addrspace(1)* %110, align 8, !tbaa !7, !amdgpu.noclobber !5
  %112 = fmul contract double %111, %111
  %113 = getelementptr inbounds %struct.point2, %struct.point2 addrspace(1)* %0, i64 %109, i32 1
  %114 = load double, double addrspace(1)* %113, align 8, !tbaa !12, !amdgpu.noclobber !5
  %115 = fmul contract double %114, %114
  %116 = fadd contract double %112, %115
  %117 = fcmp contract ole double %116, %20
  %118 = zext i1 %117 to i32
  %119 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %109
  store i32 %118, i32 addrspace(1)* %119, align 4, !tbaa !13
  %120 = or i32 %22, 7
  %121 = mul nuw nsw i32 %120, %9
  %122 = add i32 %121, %14
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds %struct.point2, %struct.point2 addrspace(1)* %0, i64 %123, i32 0
  %125 = load double, double addrspace(1)* %124, align 8, !tbaa !7, !amdgpu.noclobber !5
  %126 = fmul contract double %125, %125
  %127 = getelementptr inbounds %struct.point2, %struct.point2 addrspace(1)* %0, i64 %123, i32 1
  %128 = load double, double addrspace(1)* %127, align 8, !tbaa !12, !amdgpu.noclobber !5
  %129 = fmul contract double %128, %128
  %130 = fadd contract double %126, %129
  %131 = fcmp contract ole double %130, %20
  %132 = zext i1 %131 to i32
  %133 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %123
  store i32 %132, i32 addrspace(1)* %133, align 4, !tbaa !13
  %134 = or i32 %22, 8
  %135 = mul nuw nsw i32 %134, %9
  %136 = add i32 %135, %14
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds %struct.point2, %struct.point2 addrspace(1)* %0, i64 %137, i32 0
  %139 = load double, double addrspace(1)* %138, align 8, !tbaa !7, !amdgpu.noclobber !5
  %140 = fmul contract double %139, %139
  %141 = getelementptr inbounds %struct.point2, %struct.point2 addrspace(1)* %0, i64 %137, i32 1
  %142 = load double, double addrspace(1)* %141, align 8, !tbaa !12, !amdgpu.noclobber !5
  %143 = fmul contract double %142, %142
  %144 = fadd contract double %140, %143
  %145 = fcmp contract ole double %144, %20
  %146 = zext i1 %145 to i32
  %147 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %137
  store i32 %146, i32 addrspace(1)* %147, align 4, !tbaa !13
  %148 = or i32 %22, 9
  %149 = mul nuw nsw i32 %148, %9
  %150 = add i32 %149, %14
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds %struct.point2, %struct.point2 addrspace(1)* %0, i64 %151, i32 0
  %153 = load double, double addrspace(1)* %152, align 8, !tbaa !7, !amdgpu.noclobber !5
  %154 = fmul contract double %153, %153
  %155 = getelementptr inbounds %struct.point2, %struct.point2 addrspace(1)* %0, i64 %151, i32 1
  %156 = load double, double addrspace(1)* %155, align 8, !tbaa !12, !amdgpu.noclobber !5
  %157 = fmul contract double %156, %156
  %158 = fadd contract double %154, %157
  %159 = fcmp contract ole double %158, %20
  %160 = zext i1 %159 to i32
  %161 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %151
  store i32 %160, i32 addrspace(1)* %161, align 4, !tbaa !13
  %162 = or i32 %22, 10
  %163 = mul nuw nsw i32 %162, %9
  %164 = add i32 %163, %14
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds %struct.point2, %struct.point2 addrspace(1)* %0, i64 %165, i32 0
  %167 = load double, double addrspace(1)* %166, align 8, !tbaa !7, !amdgpu.noclobber !5
  %168 = fmul contract double %167, %167
  %169 = getelementptr inbounds %struct.point2, %struct.point2 addrspace(1)* %0, i64 %165, i32 1
  %170 = load double, double addrspace(1)* %169, align 8, !tbaa !12, !amdgpu.noclobber !5
  %171 = fmul contract double %170, %170
  %172 = fadd contract double %168, %171
  %173 = fcmp contract ole double %172, %20
  %174 = zext i1 %173 to i32
  %175 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %165
  store i32 %174, i32 addrspace(1)* %175, align 4, !tbaa !13
  %176 = or i32 %22, 11
  %177 = mul nuw nsw i32 %176, %9
  %178 = add i32 %177, %14
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds %struct.point2, %struct.point2 addrspace(1)* %0, i64 %179, i32 0
  %181 = load double, double addrspace(1)* %180, align 8, !tbaa !7, !amdgpu.noclobber !5
  %182 = fmul contract double %181, %181
  %183 = getelementptr inbounds %struct.point2, %struct.point2 addrspace(1)* %0, i64 %179, i32 1
  %184 = load double, double addrspace(1)* %183, align 8, !tbaa !12, !amdgpu.noclobber !5
  %185 = fmul contract double %184, %184
  %186 = fadd contract double %182, %185
  %187 = fcmp contract ole double %186, %20
  %188 = zext i1 %187 to i32
  %189 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %179
  store i32 %188, i32 addrspace(1)* %189, align 4, !tbaa !13
  %190 = or i32 %22, 12
  %191 = mul nuw nsw i32 %190, %9
  %192 = add i32 %191, %14
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds %struct.point2, %struct.point2 addrspace(1)* %0, i64 %193, i32 0
  %195 = load double, double addrspace(1)* %194, align 8, !tbaa !7, !amdgpu.noclobber !5
  %196 = fmul contract double %195, %195
  %197 = getelementptr inbounds %struct.point2, %struct.point2 addrspace(1)* %0, i64 %193, i32 1
  %198 = load double, double addrspace(1)* %197, align 8, !tbaa !12, !amdgpu.noclobber !5
  %199 = fmul contract double %198, %198
  %200 = fadd contract double %196, %199
  %201 = fcmp contract ole double %200, %20
  %202 = zext i1 %201 to i32
  %203 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %193
  store i32 %202, i32 addrspace(1)* %203, align 4, !tbaa !13
  %204 = or i32 %22, 13
  %205 = mul nuw nsw i32 %204, %9
  %206 = add i32 %205, %14
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds %struct.point2, %struct.point2 addrspace(1)* %0, i64 %207, i32 0
  %209 = load double, double addrspace(1)* %208, align 8, !tbaa !7, !amdgpu.noclobber !5
  %210 = fmul contract double %209, %209
  %211 = getelementptr inbounds %struct.point2, %struct.point2 addrspace(1)* %0, i64 %207, i32 1
  %212 = load double, double addrspace(1)* %211, align 8, !tbaa !12, !amdgpu.noclobber !5
  %213 = fmul contract double %212, %212
  %214 = fadd contract double %210, %213
  %215 = fcmp contract ole double %214, %20
  %216 = zext i1 %215 to i32
  %217 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %207
  store i32 %216, i32 addrspace(1)* %217, align 4, !tbaa !13
  %218 = or i32 %22, 14
  %219 = mul nuw nsw i32 %218, %9
  %220 = add i32 %219, %14
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds %struct.point2, %struct.point2 addrspace(1)* %0, i64 %221, i32 0
  %223 = load double, double addrspace(1)* %222, align 8, !tbaa !7, !amdgpu.noclobber !5
  %224 = fmul contract double %223, %223
  %225 = getelementptr inbounds %struct.point2, %struct.point2 addrspace(1)* %0, i64 %221, i32 1
  %226 = load double, double addrspace(1)* %225, align 8, !tbaa !12, !amdgpu.noclobber !5
  %227 = fmul contract double %226, %226
  %228 = fadd contract double %224, %227
  %229 = fcmp contract ole double %228, %20
  %230 = zext i1 %229 to i32
  %231 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %221
  store i32 %230, i32 addrspace(1)* %231, align 4, !tbaa !13
  %232 = or i32 %22, 15
  %233 = mul nuw nsw i32 %232, %9
  %234 = add i32 %233, %14
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds %struct.point2, %struct.point2 addrspace(1)* %0, i64 %235, i32 0
  %237 = load double, double addrspace(1)* %236, align 8, !tbaa !7, !amdgpu.noclobber !5
  %238 = fmul contract double %237, %237
  %239 = getelementptr inbounds %struct.point2, %struct.point2 addrspace(1)* %0, i64 %235, i32 1
  %240 = load double, double addrspace(1)* %239, align 8, !tbaa !12, !amdgpu.noclobber !5
  %241 = fmul contract double %240, %240
  %242 = fadd contract double %238, %241
  %243 = fcmp contract ole double %242, %20
  %244 = zext i1 %243 to i32
  %245 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %235
  store i32 %244, i32 addrspace(1)* %245, align 4, !tbaa !13
  %246 = add nuw nsw i32 %22, 16
  %247 = icmp eq i32 %246, 32
  br i1 %247, label %248, label %21, !llvm.loop !15

248:                                              ; preds = %21, %4
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
!7 = !{!8, !9, i64 0}
!8 = !{!"_ZTS6point2", !9, i64 0, !9, i64 8}
!9 = !{!"double", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C++ TBAA"}
!12 = !{!8, !9, i64 8}
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !10, i64 0}
!15 = distinct !{!15, !16, !17}
!16 = !{!"llvm.loop.mustprogress"}
!17 = !{!"llvm.loop.unroll.disable"}
