; ModuleID = '../data/hip_kernels/1187/11/main.cu'
source_filename = "../data/hip_kernels/1187/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z22sga_down_data_backwardiPKfPfiiiiS1_(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2, i32 %3, i32 %4, i32 %5, i32 %6, float addrspace(1)* nocapture %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = icmp slt i32 %17, %0
  br i1 %18, label %19, label %225

19:                                               ; preds = %8
  %20 = mul nsw i32 %4, %3
  %21 = freeze i32 %17
  %22 = freeze i32 %4
  %23 = sdiv i32 %21, %22
  %24 = mul nsw i32 %23, %20
  %25 = mul nsw i32 %24, %5
  %26 = mul i32 %23, %22
  %27 = sub i32 %21, %26
  %28 = add nsw i32 %25, %27
  %29 = mul nsw i32 %24, %6
  %30 = add nsw i32 %29, %27
  %31 = icmp sgt i32 %3, 0
  br i1 %31, label %32, label %225

32:                                               ; preds = %19
  %33 = icmp sgt i32 %5, 0
  %34 = shl nsw i32 %4, 1
  %35 = add i32 %20, %4
  %36 = shl i32 %35, 1
  %37 = mul nsw i32 %20, 3
  %38 = shl nsw i32 %20, 2
  br label %51

39:                                               ; preds = %128, %51
  %40 = icmp sgt i32 %52, 1
  br i1 %40, label %51, label %41, !llvm.loop !7

41:                                               ; preds = %39
  br i1 %31, label %42, label %225

42:                                               ; preds = %41
  %43 = mul nsw i32 %20, 3
  %44 = add nsw i32 %5, -1
  %45 = mul nsw i32 %44, %20
  %46 = shl nsw i32 %20, 2
  %47 = and i32 %3, 1
  %48 = icmp eq i32 %3, 1
  br i1 %48, label %195, label %49

49:                                               ; preds = %42
  %50 = and i32 %3, -2
  br label %136

51:                                               ; preds = %32, %39
  %52 = phi i32 [ %3, %32 ], [ %53, %39 ]
  %53 = add nsw i32 %52, -1
  %54 = mul nsw i32 %53, %4
  %55 = add nsw i32 %54, %30
  br i1 %33, label %56, label %39

56:                                               ; preds = %51
  %57 = add i32 %54, %28
  %58 = icmp slt i32 %52, %3
  %59 = add nsw i32 %55, %4
  %60 = add nsw i32 %59, %20
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %1, i64 %61
  %63 = add nuw nsw i32 %52, 1
  %64 = icmp slt i32 %63, %3
  %65 = add i32 %36, %55
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %1, i64 %66
  %68 = add nsw i32 %59, %37
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %1, i64 %69
  %71 = add nsw i32 %59, %38
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %1, i64 %72
  %74 = sext i32 %55 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %1, i64 %74
  br label %76

76:                                               ; preds = %56, %128
  %77 = phi i32 [ 0, %56 ], [ %103, %128 ]
  %78 = mul nsw i32 %77, %20
  %79 = add i32 %57, %78
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %2, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !9
  br i1 %58, label %83, label %91

83:                                               ; preds = %76
  %84 = add nsw i32 %79, %4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %2, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !9
  %88 = load float, float addrspace(1)* %62, align 4, !tbaa !9
  %89 = fmul contract float %87, %88
  %90 = fadd contract float %82, %89
  br label %91

91:                                               ; preds = %83, %76
  %92 = phi float [ %90, %83 ], [ %82, %76 ]
  br i1 %64, label %93, label %101

93:                                               ; preds = %91
  %94 = add nsw i32 %79, %34
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %2, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !9
  %98 = load float, float addrspace(1)* %67, align 4, !tbaa !9
  %99 = fmul contract float %97, %98
  %100 = fadd contract float %92, %99
  br label %101

101:                                              ; preds = %93, %91
  %102 = phi float [ %100, %93 ], [ %92, %91 ]
  %103 = add nuw nsw i32 %77, 1
  %104 = icmp slt i32 %103, %5
  %105 = select i1 %58, i1 %104, i1 false
  br i1 %105, label %106, label %115

106:                                              ; preds = %101
  %107 = add nsw i32 %79, %4
  %108 = add nsw i32 %107, %20
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %2, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !9
  %112 = load float, float addrspace(1)* %70, align 4, !tbaa !9
  %113 = fmul contract float %111, %112
  %114 = fadd contract float %102, %113
  br label %115

115:                                              ; preds = %106, %101
  %116 = phi float [ %114, %106 ], [ %102, %101 ]
  %117 = icmp ne i32 %77, 0
  %118 = select i1 %58, i1 %117, i1 false
  br i1 %118, label %119, label %128

119:                                              ; preds = %115
  %120 = add nsw i32 %79, %4
  %121 = sub i32 %120, %20
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %2, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !9
  %125 = load float, float addrspace(1)* %73, align 4, !tbaa !9
  %126 = fmul contract float %124, %125
  %127 = fadd contract float %116, %126
  br label %128

128:                                              ; preds = %119, %115
  %129 = phi float [ %127, %119 ], [ %116, %115 ]
  store float %129, float addrspace(1)* %81, align 4, !tbaa !9
  %130 = load float, float addrspace(1)* %75, align 4, !tbaa !9
  %131 = fmul contract float %129, %130
  %132 = getelementptr inbounds float, float addrspace(1)* %7, i64 %80
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !9
  %134 = fadd contract float %133, %131
  store float %134, float addrspace(1)* %132, align 4, !tbaa !9
  %135 = icmp eq i32 %103, %5
  br i1 %135, label %39, label %76, !llvm.loop !13

136:                                              ; preds = %136, %49
  %137 = phi i32 [ 0, %49 ], [ %192, %136 ]
  %138 = phi i32 [ 0, %49 ], [ %193, %136 ]
  %139 = mul nsw i32 %137, %4
  %140 = add nsw i32 %139, %28
  %141 = add nsw i32 %139, %30
  %142 = sext i32 %140 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %2, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !9
  %145 = add nsw i32 %141, %43
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %1, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !9
  %149 = fmul contract float %144, %148
  %150 = getelementptr inbounds float, float addrspace(1)* %7, i64 %142
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !9
  %152 = fadd contract float %151, %149
  store float %152, float addrspace(1)* %150, align 4, !tbaa !9
  %153 = add nsw i32 %140, %45
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %2, i64 %154
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !9
  %157 = add nsw i32 %141, %46
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %1, i64 %158
  %160 = load float, float addrspace(1)* %159, align 4, !tbaa !9
  %161 = fmul contract float %156, %160
  %162 = getelementptr inbounds float, float addrspace(1)* %7, i64 %154
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !9
  %164 = fadd contract float %163, %161
  store float %164, float addrspace(1)* %162, align 4, !tbaa !9
  %165 = or i32 %137, 1
  %166 = mul nsw i32 %165, %4
  %167 = add nsw i32 %166, %28
  %168 = add nsw i32 %166, %30
  %169 = sext i32 %167 to i64
  %170 = getelementptr inbounds float, float addrspace(1)* %2, i64 %169
  %171 = load float, float addrspace(1)* %170, align 4, !tbaa !9
  %172 = add nsw i32 %168, %43
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds float, float addrspace(1)* %1, i64 %173
  %175 = load float, float addrspace(1)* %174, align 4, !tbaa !9
  %176 = fmul contract float %171, %175
  %177 = getelementptr inbounds float, float addrspace(1)* %7, i64 %169
  %178 = load float, float addrspace(1)* %177, align 4, !tbaa !9
  %179 = fadd contract float %178, %176
  store float %179, float addrspace(1)* %177, align 4, !tbaa !9
  %180 = add nsw i32 %167, %45
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds float, float addrspace(1)* %2, i64 %181
  %183 = load float, float addrspace(1)* %182, align 4, !tbaa !9
  %184 = add nsw i32 %168, %46
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds float, float addrspace(1)* %1, i64 %185
  %187 = load float, float addrspace(1)* %186, align 4, !tbaa !9
  %188 = fmul contract float %183, %187
  %189 = getelementptr inbounds float, float addrspace(1)* %7, i64 %181
  %190 = load float, float addrspace(1)* %189, align 4, !tbaa !9
  %191 = fadd contract float %190, %188
  store float %191, float addrspace(1)* %189, align 4, !tbaa !9
  %192 = add nuw nsw i32 %137, 2
  %193 = add i32 %138, 2
  %194 = icmp eq i32 %193, %50
  br i1 %194, label %195, label %136, !llvm.loop !14

195:                                              ; preds = %136, %42
  %196 = phi i32 [ 0, %42 ], [ %192, %136 ]
  %197 = icmp eq i32 %47, 0
  br i1 %197, label %225, label %198

198:                                              ; preds = %195
  %199 = mul nsw i32 %196, %4
  %200 = add nsw i32 %199, %28
  %201 = add nsw i32 %199, %30
  %202 = sext i32 %200 to i64
  %203 = getelementptr inbounds float, float addrspace(1)* %2, i64 %202
  %204 = load float, float addrspace(1)* %203, align 4, !tbaa !9
  %205 = add nsw i32 %201, %43
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds float, float addrspace(1)* %1, i64 %206
  %208 = load float, float addrspace(1)* %207, align 4, !tbaa !9
  %209 = fmul contract float %204, %208
  %210 = getelementptr inbounds float, float addrspace(1)* %7, i64 %202
  %211 = load float, float addrspace(1)* %210, align 4, !tbaa !9
  %212 = fadd contract float %211, %209
  store float %212, float addrspace(1)* %210, align 4, !tbaa !9
  %213 = add nsw i32 %200, %45
  %214 = sext i32 %213 to i64
  %215 = getelementptr inbounds float, float addrspace(1)* %2, i64 %214
  %216 = load float, float addrspace(1)* %215, align 4, !tbaa !9
  %217 = add nsw i32 %201, %46
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds float, float addrspace(1)* %1, i64 %218
  %220 = load float, float addrspace(1)* %219, align 4, !tbaa !9
  %221 = fmul contract float %216, %220
  %222 = getelementptr inbounds float, float addrspace(1)* %7, i64 %214
  %223 = load float, float addrspace(1)* %222, align 4, !tbaa !9
  %224 = fadd contract float %223, %221
  store float %224, float addrspace(1)* %222, align 4, !tbaa !9
  br label %225

225:                                              ; preds = %198, %195, %19, %41, %8
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
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!10, !10, i64 0}
!10 = !{!"float", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C++ TBAA"}
!13 = distinct !{!13, !8}
!14 = distinct !{!14, !8}
