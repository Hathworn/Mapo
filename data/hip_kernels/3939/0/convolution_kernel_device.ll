; ModuleID = '../data/hip_kernels/3939/0/main.cu'
source_filename = "../data/hip_kernels/3939/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z18convolution_kerneliiiPdiiiS_S_iiiiS_(i32 %0, i32 %1, i32 %2, double addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6, double addrspace(1)* nocapture readonly %7, double addrspace(1)* nocapture readonly %8, i32 %9, i32 %10, i32 %11, i32 %12, double addrspace(1)* nocapture writeonly %13) local_unnamed_addr #0 {
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %15, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %25 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %26 = bitcast i8 addrspace(4)* %25 to i16 addrspace(4)*
  %27 = load i16, i16 addrspace(4)* %26, align 4, !range !4, !invariant.load !5
  %28 = zext i16 %27 to i32
  %29 = mul i32 %24, %28
  %30 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %31 = add i32 %29, %30
  %32 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %33 = getelementptr i8, i8 addrspace(4)* %15, i64 8
  %34 = bitcast i8 addrspace(4)* %33 to i16 addrspace(4)*
  %35 = load i16, i16 addrspace(4)* %34, align 4, !range !4, !invariant.load !5
  %36 = zext i16 %35 to i32
  %37 = mul i32 %32, %36
  %38 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !6
  %39 = add i32 %37, %38
  %40 = icmp slt i32 %23, %10
  %41 = icmp slt i32 %31, %11
  %42 = select i1 %40, i1 %41, i1 false
  %43 = icmp slt i32 %39, %12
  %44 = select i1 %42, i1 %43, i1 false
  br i1 %44, label %45, label %226

45:                                               ; preds = %14
  %46 = icmp sgt i32 %6, 0
  br i1 %46, label %47, label %64

47:                                               ; preds = %45
  %48 = icmp sgt i32 %4, 0
  %49 = icmp sgt i32 %5, 0
  %50 = mul i32 %5, %4
  %51 = mul i32 %50, %6
  %52 = mul i32 %51, %39
  %53 = and i32 %5, 7
  %54 = icmp ult i32 %5, 8
  %55 = and i32 %5, -8
  %56 = icmp eq i32 %53, 0
  br label %57

57:                                               ; preds = %47, %86
  %58 = phi i32 [ 0, %47 ], [ %89, %86 ]
  %59 = phi i32 [ 0, %47 ], [ %88, %86 ]
  %60 = phi double [ 0.000000e+00, %47 ], [ %87, %86 ]
  br i1 %48, label %61, label %86

61:                                               ; preds = %57
  %62 = mul i32 %58, %0
  %63 = add i32 %62, %23
  br label %78

64:                                               ; preds = %86, %45
  %65 = phi double [ 0.000000e+00, %45 ], [ %87, %86 ]
  %66 = sext i32 %39 to i64
  %67 = getelementptr inbounds double, double addrspace(1)* %8, i64 %66
  %68 = load double, double addrspace(1)* %67, align 8, !tbaa !7, !amdgpu.noclobber !5
  %69 = fadd contract double %65, %68
  %70 = fcmp contract olt double %69, 0.000000e+00
  %71 = mul i32 %39, %10
  %72 = add i32 %71, %23
  %73 = mul i32 %72, %11
  %74 = add i32 %73, %31
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds double, double addrspace(1)* %13, i64 %75
  %77 = select i1 %70, double 0.000000e+00, double %69
  store double %77, double addrspace(1)* %76, align 8, !tbaa !7
  br label %226

78:                                               ; preds = %61, %118
  %79 = phi i32 [ 0, %61 ], [ %121, %118 ]
  %80 = phi i32 [ %59, %61 ], [ %120, %118 ]
  %81 = phi double [ %60, %61 ], [ %119, %118 ]
  br i1 %49, label %82, label %118

82:                                               ; preds = %78
  %83 = add i32 %63, %79
  %84 = mul i32 %83, %1
  %85 = add i32 %84, %31
  br i1 %54, label %91, label %123

86:                                               ; preds = %118, %57
  %87 = phi double [ %60, %57 ], [ %119, %118 ]
  %88 = phi i32 [ %59, %57 ], [ %120, %118 ]
  %89 = add nuw nsw i32 %58, 1
  %90 = icmp eq i32 %89, %6
  br i1 %90, label %64, label %57, !llvm.loop !11

91:                                               ; preds = %123, %82
  %92 = phi double [ undef, %82 ], [ %221, %123 ]
  %93 = phi i32 [ 0, %82 ], [ %223, %123 ]
  %94 = phi i32 [ %80, %82 ], [ %222, %123 ]
  %95 = phi double [ %81, %82 ], [ %221, %123 ]
  br i1 %56, label %115, label %96

96:                                               ; preds = %91, %96
  %97 = phi i32 [ %112, %96 ], [ %93, %91 ]
  %98 = phi i32 [ %111, %96 ], [ %94, %91 ]
  %99 = phi double [ %110, %96 ], [ %95, %91 ]
  %100 = phi i32 [ %113, %96 ], [ 0, %91 ]
  %101 = add i32 %85, %97
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds double, double addrspace(1)* %3, i64 %102
  %104 = load double, double addrspace(1)* %103, align 8, !tbaa !7, !amdgpu.noclobber !5
  %105 = add nsw i32 %98, %52
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds double, double addrspace(1)* %7, i64 %106
  %108 = load double, double addrspace(1)* %107, align 8, !tbaa !7, !amdgpu.noclobber !5
  %109 = fmul contract double %104, %108
  %110 = fadd contract double %99, %109
  %111 = add nsw i32 %98, 1
  %112 = add nuw nsw i32 %97, 1
  %113 = add i32 %100, 1
  %114 = icmp eq i32 %113, %53
  br i1 %114, label %115, label %96, !llvm.loop !13

115:                                              ; preds = %96, %91
  %116 = phi double [ %92, %91 ], [ %110, %96 ]
  %117 = add i32 %80, %5
  br label %118

118:                                              ; preds = %115, %78
  %119 = phi double [ %81, %78 ], [ %116, %115 ]
  %120 = phi i32 [ %80, %78 ], [ %117, %115 ]
  %121 = add nuw nsw i32 %79, 1
  %122 = icmp eq i32 %121, %4
  br i1 %122, label %86, label %78, !llvm.loop !15

123:                                              ; preds = %82, %123
  %124 = phi i32 [ %223, %123 ], [ 0, %82 ]
  %125 = phi i32 [ %222, %123 ], [ %80, %82 ]
  %126 = phi double [ %221, %123 ], [ %81, %82 ]
  %127 = phi i32 [ %224, %123 ], [ 0, %82 ]
  %128 = add i32 %85, %124
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds double, double addrspace(1)* %3, i64 %129
  %131 = load double, double addrspace(1)* %130, align 8, !tbaa !7, !amdgpu.noclobber !5
  %132 = add nsw i32 %125, %52
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds double, double addrspace(1)* %7, i64 %133
  %135 = load double, double addrspace(1)* %134, align 8, !tbaa !7, !amdgpu.noclobber !5
  %136 = fmul contract double %131, %135
  %137 = fadd contract double %126, %136
  %138 = add nsw i32 %125, 1
  %139 = or i32 %124, 1
  %140 = add i32 %85, %139
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds double, double addrspace(1)* %3, i64 %141
  %143 = load double, double addrspace(1)* %142, align 8, !tbaa !7, !amdgpu.noclobber !5
  %144 = add nsw i32 %138, %52
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds double, double addrspace(1)* %7, i64 %145
  %147 = load double, double addrspace(1)* %146, align 8, !tbaa !7, !amdgpu.noclobber !5
  %148 = fmul contract double %143, %147
  %149 = fadd contract double %137, %148
  %150 = add nsw i32 %125, 2
  %151 = or i32 %124, 2
  %152 = add i32 %85, %151
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds double, double addrspace(1)* %3, i64 %153
  %155 = load double, double addrspace(1)* %154, align 8, !tbaa !7, !amdgpu.noclobber !5
  %156 = add nsw i32 %150, %52
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds double, double addrspace(1)* %7, i64 %157
  %159 = load double, double addrspace(1)* %158, align 8, !tbaa !7, !amdgpu.noclobber !5
  %160 = fmul contract double %155, %159
  %161 = fadd contract double %149, %160
  %162 = add nsw i32 %125, 3
  %163 = or i32 %124, 3
  %164 = add i32 %85, %163
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds double, double addrspace(1)* %3, i64 %165
  %167 = load double, double addrspace(1)* %166, align 8, !tbaa !7, !amdgpu.noclobber !5
  %168 = add nsw i32 %162, %52
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds double, double addrspace(1)* %7, i64 %169
  %171 = load double, double addrspace(1)* %170, align 8, !tbaa !7, !amdgpu.noclobber !5
  %172 = fmul contract double %167, %171
  %173 = fadd contract double %161, %172
  %174 = add nsw i32 %125, 4
  %175 = or i32 %124, 4
  %176 = add i32 %85, %175
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds double, double addrspace(1)* %3, i64 %177
  %179 = load double, double addrspace(1)* %178, align 8, !tbaa !7, !amdgpu.noclobber !5
  %180 = add nsw i32 %174, %52
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds double, double addrspace(1)* %7, i64 %181
  %183 = load double, double addrspace(1)* %182, align 8, !tbaa !7, !amdgpu.noclobber !5
  %184 = fmul contract double %179, %183
  %185 = fadd contract double %173, %184
  %186 = add nsw i32 %125, 5
  %187 = or i32 %124, 5
  %188 = add i32 %85, %187
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds double, double addrspace(1)* %3, i64 %189
  %191 = load double, double addrspace(1)* %190, align 8, !tbaa !7, !amdgpu.noclobber !5
  %192 = add nsw i32 %186, %52
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds double, double addrspace(1)* %7, i64 %193
  %195 = load double, double addrspace(1)* %194, align 8, !tbaa !7, !amdgpu.noclobber !5
  %196 = fmul contract double %191, %195
  %197 = fadd contract double %185, %196
  %198 = add nsw i32 %125, 6
  %199 = or i32 %124, 6
  %200 = add i32 %85, %199
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds double, double addrspace(1)* %3, i64 %201
  %203 = load double, double addrspace(1)* %202, align 8, !tbaa !7, !amdgpu.noclobber !5
  %204 = add nsw i32 %198, %52
  %205 = sext i32 %204 to i64
  %206 = getelementptr inbounds double, double addrspace(1)* %7, i64 %205
  %207 = load double, double addrspace(1)* %206, align 8, !tbaa !7, !amdgpu.noclobber !5
  %208 = fmul contract double %203, %207
  %209 = fadd contract double %197, %208
  %210 = add nsw i32 %125, 7
  %211 = or i32 %124, 7
  %212 = add i32 %85, %211
  %213 = sext i32 %212 to i64
  %214 = getelementptr inbounds double, double addrspace(1)* %3, i64 %213
  %215 = load double, double addrspace(1)* %214, align 8, !tbaa !7, !amdgpu.noclobber !5
  %216 = add nsw i32 %210, %52
  %217 = sext i32 %216 to i64
  %218 = getelementptr inbounds double, double addrspace(1)* %7, i64 %217
  %219 = load double, double addrspace(1)* %218, align 8, !tbaa !7, !amdgpu.noclobber !5
  %220 = fmul contract double %215, %219
  %221 = fadd contract double %209, %220
  %222 = add nsw i32 %125, 8
  %223 = add nuw nsw i32 %124, 8
  %224 = add i32 %127, 8
  %225 = icmp eq i32 %224, %55
  br i1 %225, label %91, label %123, !llvm.loop !16

226:                                              ; preds = %64, %14
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

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
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !12}
