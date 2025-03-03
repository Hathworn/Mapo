; ModuleID = '../data/hip_kernels/14087/12/main.cu'
source_filename = "../data/hip_kernels/14087/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@shared_mem = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z24cuda_graph_maxpool_bpropPfPKfS1_iii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_mem, i32 0, i32 %3
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, %4
  %11 = zext i32 %10 to i64
  %12 = getelementptr inbounds float, float addrspace(1)* %0, i64 %11
  %13 = mul i32 %9, %3
  %14 = zext i32 %13 to i64
  %15 = getelementptr inbounds float, float addrspace(1)* %1, i64 %14
  %16 = getelementptr inbounds float, float addrspace(1)* %2, i64 %14
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %17 = icmp sgt i32 %5, 0
  br i1 %17, label %18, label %49

18:                                               ; preds = %6
  %19 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %20 = getelementptr i8, i8 addrspace(4)* %19, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !5, !invariant.load !6
  %23 = zext i16 %22 to i32
  %24 = and i32 %5, 3
  %25 = icmp ult i32 %5, 4
  br i1 %25, label %28, label %26

26:                                               ; preds = %18
  %27 = and i32 %5, -4
  br label %58

28:                                               ; preds = %111, %18
  %29 = phi i32 [ 0, %18 ], [ %112, %111 ]
  %30 = icmp eq i32 %24, 0
  br i1 %30, label %49, label %31

31:                                               ; preds = %28, %45
  %32 = phi i32 [ %46, %45 ], [ %29, %28 ]
  %33 = phi i32 [ %47, %45 ], [ 0, %28 ]
  %34 = mul i32 %32, %23
  %35 = add i32 %34, %8
  %36 = icmp slt i32 %35, %3
  br i1 %36, label %37, label %45

37:                                               ; preds = %31
  %38 = sext i32 %35 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %15, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !7, !amdgpu.noclobber !6
  %41 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_mem, i32 0, i32 %35
  store float %40, float addrspace(3)* %41, align 4, !tbaa !7
  %42 = getelementptr inbounds float, float addrspace(1)* %16, i64 %38
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !6
  %44 = getelementptr inbounds float, float addrspace(3)* %7, i32 %35
  store float %43, float addrspace(3)* %44, align 4, !tbaa !7
  br label %45

45:                                               ; preds = %37, %31
  %46 = add nuw nsw i32 %32, 1
  %47 = add i32 %33, 1
  %48 = icmp eq i32 %47, %24
  br i1 %48, label %49, label %31, !llvm.loop !11

49:                                               ; preds = %28, %45, %6
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %50 = icmp eq i32 %8, 1
  %51 = icmp sgt i32 %3, 0
  %52 = select i1 %50, i1 %51, i1 false
  br i1 %52, label %53, label %236

53:                                               ; preds = %49
  %54 = and i32 %3, 7
  %55 = icmp ult i32 %3, 8
  br i1 %55, label %216, label %56

56:                                               ; preds = %53
  %57 = and i32 %3, -8
  br label %115

58:                                               ; preds = %111, %26
  %59 = phi i32 [ 0, %26 ], [ %112, %111 ]
  %60 = phi i32 [ 0, %26 ], [ %113, %111 ]
  %61 = mul i32 %59, %23
  %62 = add i32 %61, %8
  %63 = icmp slt i32 %62, %3
  br i1 %63, label %64, label %72

64:                                               ; preds = %58
  %65 = sext i32 %62 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %15, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7, !amdgpu.noclobber !6
  %68 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_mem, i32 0, i32 %62
  store float %67, float addrspace(3)* %68, align 4, !tbaa !7
  %69 = getelementptr inbounds float, float addrspace(1)* %16, i64 %65
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7, !amdgpu.noclobber !6
  %71 = getelementptr inbounds float, float addrspace(3)* %7, i32 %62
  store float %70, float addrspace(3)* %71, align 4, !tbaa !7
  br label %72

72:                                               ; preds = %64, %58
  %73 = or i32 %59, 1
  %74 = mul i32 %73, %23
  %75 = add i32 %74, %8
  %76 = icmp slt i32 %75, %3
  br i1 %76, label %77, label %85

77:                                               ; preds = %72
  %78 = sext i32 %75 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %15, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !7, !amdgpu.noclobber !6
  %81 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_mem, i32 0, i32 %75
  store float %80, float addrspace(3)* %81, align 4, !tbaa !7
  %82 = getelementptr inbounds float, float addrspace(1)* %16, i64 %78
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !7, !amdgpu.noclobber !6
  %84 = getelementptr inbounds float, float addrspace(3)* %7, i32 %75
  store float %83, float addrspace(3)* %84, align 4, !tbaa !7
  br label %85

85:                                               ; preds = %77, %72
  %86 = or i32 %59, 2
  %87 = mul i32 %86, %23
  %88 = add i32 %87, %8
  %89 = icmp slt i32 %88, %3
  br i1 %89, label %90, label %98

90:                                               ; preds = %85
  %91 = sext i32 %88 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %15, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !7, !amdgpu.noclobber !6
  %94 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_mem, i32 0, i32 %88
  store float %93, float addrspace(3)* %94, align 4, !tbaa !7
  %95 = getelementptr inbounds float, float addrspace(1)* %16, i64 %91
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !7, !amdgpu.noclobber !6
  %97 = getelementptr inbounds float, float addrspace(3)* %7, i32 %88
  store float %96, float addrspace(3)* %97, align 4, !tbaa !7
  br label %98

98:                                               ; preds = %90, %85
  %99 = or i32 %59, 3
  %100 = mul i32 %99, %23
  %101 = add i32 %100, %8
  %102 = icmp slt i32 %101, %3
  br i1 %102, label %103, label %111

103:                                              ; preds = %98
  %104 = sext i32 %101 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %15, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7, !amdgpu.noclobber !6
  %107 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_mem, i32 0, i32 %101
  store float %106, float addrspace(3)* %107, align 4, !tbaa !7
  %108 = getelementptr inbounds float, float addrspace(1)* %16, i64 %104
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !7, !amdgpu.noclobber !6
  %110 = getelementptr inbounds float, float addrspace(3)* %7, i32 %101
  store float %109, float addrspace(3)* %110, align 4, !tbaa !7
  br label %111

111:                                              ; preds = %103, %98
  %112 = add nuw nsw i32 %59, 4
  %113 = add i32 %60, 4
  %114 = icmp eq i32 %113, %27
  br i1 %114, label %28, label %58, !llvm.loop !13

115:                                              ; preds = %115, %56
  %116 = phi i32 [ 0, %56 ], [ %213, %115 ]
  %117 = phi i32 [ 0, %56 ], [ %214, %115 ]
  %118 = zext i32 %116 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %15, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !7
  %121 = getelementptr inbounds float, float addrspace(3)* %7, i32 %116
  %122 = load float, float addrspace(3)* %121, align 4, !tbaa !7
  %123 = fptosi float %122 to i32
  %124 = add nsw i32 %123, -1
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %12, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !7
  %128 = fadd contract float %120, %127
  store float %128, float addrspace(1)* %126, align 4, !tbaa !7
  %129 = or i32 %116, 1
  %130 = zext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %15, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !7
  %133 = getelementptr inbounds float, float addrspace(3)* %7, i32 %129
  %134 = load float, float addrspace(3)* %133, align 4, !tbaa !7
  %135 = fptosi float %134 to i32
  %136 = add nsw i32 %135, -1
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %12, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !7
  %140 = fadd contract float %132, %139
  store float %140, float addrspace(1)* %138, align 4, !tbaa !7
  %141 = or i32 %116, 2
  %142 = zext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %15, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !7
  %145 = getelementptr inbounds float, float addrspace(3)* %7, i32 %141
  %146 = load float, float addrspace(3)* %145, align 4, !tbaa !7
  %147 = fptosi float %146 to i32
  %148 = add nsw i32 %147, -1
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %12, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !7
  %152 = fadd contract float %144, %151
  store float %152, float addrspace(1)* %150, align 4, !tbaa !7
  %153 = or i32 %116, 3
  %154 = zext i32 %153 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %15, i64 %154
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !7
  %157 = getelementptr inbounds float, float addrspace(3)* %7, i32 %153
  %158 = load float, float addrspace(3)* %157, align 4, !tbaa !7
  %159 = fptosi float %158 to i32
  %160 = add nsw i32 %159, -1
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds float, float addrspace(1)* %12, i64 %161
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !7
  %164 = fadd contract float %156, %163
  store float %164, float addrspace(1)* %162, align 4, !tbaa !7
  %165 = or i32 %116, 4
  %166 = zext i32 %165 to i64
  %167 = getelementptr inbounds float, float addrspace(1)* %15, i64 %166
  %168 = load float, float addrspace(1)* %167, align 4, !tbaa !7
  %169 = getelementptr inbounds float, float addrspace(3)* %7, i32 %165
  %170 = load float, float addrspace(3)* %169, align 4, !tbaa !7
  %171 = fptosi float %170 to i32
  %172 = add nsw i32 %171, -1
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds float, float addrspace(1)* %12, i64 %173
  %175 = load float, float addrspace(1)* %174, align 4, !tbaa !7
  %176 = fadd contract float %168, %175
  store float %176, float addrspace(1)* %174, align 4, !tbaa !7
  %177 = or i32 %116, 5
  %178 = zext i32 %177 to i64
  %179 = getelementptr inbounds float, float addrspace(1)* %15, i64 %178
  %180 = load float, float addrspace(1)* %179, align 4, !tbaa !7
  %181 = getelementptr inbounds float, float addrspace(3)* %7, i32 %177
  %182 = load float, float addrspace(3)* %181, align 4, !tbaa !7
  %183 = fptosi float %182 to i32
  %184 = add nsw i32 %183, -1
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds float, float addrspace(1)* %12, i64 %185
  %187 = load float, float addrspace(1)* %186, align 4, !tbaa !7
  %188 = fadd contract float %180, %187
  store float %188, float addrspace(1)* %186, align 4, !tbaa !7
  %189 = or i32 %116, 6
  %190 = zext i32 %189 to i64
  %191 = getelementptr inbounds float, float addrspace(1)* %15, i64 %190
  %192 = load float, float addrspace(1)* %191, align 4, !tbaa !7
  %193 = getelementptr inbounds float, float addrspace(3)* %7, i32 %189
  %194 = load float, float addrspace(3)* %193, align 4, !tbaa !7
  %195 = fptosi float %194 to i32
  %196 = add nsw i32 %195, -1
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds float, float addrspace(1)* %12, i64 %197
  %199 = load float, float addrspace(1)* %198, align 4, !tbaa !7
  %200 = fadd contract float %192, %199
  store float %200, float addrspace(1)* %198, align 4, !tbaa !7
  %201 = or i32 %116, 7
  %202 = zext i32 %201 to i64
  %203 = getelementptr inbounds float, float addrspace(1)* %15, i64 %202
  %204 = load float, float addrspace(1)* %203, align 4, !tbaa !7
  %205 = getelementptr inbounds float, float addrspace(3)* %7, i32 %201
  %206 = load float, float addrspace(3)* %205, align 4, !tbaa !7
  %207 = fptosi float %206 to i32
  %208 = add nsw i32 %207, -1
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds float, float addrspace(1)* %12, i64 %209
  %211 = load float, float addrspace(1)* %210, align 4, !tbaa !7
  %212 = fadd contract float %204, %211
  store float %212, float addrspace(1)* %210, align 4, !tbaa !7
  %213 = add nuw nsw i32 %116, 8
  %214 = add i32 %117, 8
  %215 = icmp eq i32 %214, %57
  br i1 %215, label %216, label %115, !llvm.loop !15

216:                                              ; preds = %115, %53
  %217 = phi i32 [ 0, %53 ], [ %213, %115 ]
  %218 = icmp eq i32 %54, 0
  br i1 %218, label %236, label %219

219:                                              ; preds = %216, %219
  %220 = phi i32 [ %233, %219 ], [ %217, %216 ]
  %221 = phi i32 [ %234, %219 ], [ 0, %216 ]
  %222 = zext i32 %220 to i64
  %223 = getelementptr inbounds float, float addrspace(1)* %15, i64 %222
  %224 = load float, float addrspace(1)* %223, align 4, !tbaa !7
  %225 = getelementptr inbounds float, float addrspace(3)* %7, i32 %220
  %226 = load float, float addrspace(3)* %225, align 4, !tbaa !7
  %227 = fptosi float %226 to i32
  %228 = add nsw i32 %227, -1
  %229 = sext i32 %228 to i64
  %230 = getelementptr inbounds float, float addrspace(1)* %12, i64 %229
  %231 = load float, float addrspace(1)* %230, align 4, !tbaa !7
  %232 = fadd contract float %224, %231
  store float %232, float addrspace(1)* %230, align 4, !tbaa !7
  %233 = add nuw nsw i32 %220, 1
  %234 = add i32 %221, 1
  %235 = icmp eq i32 %234, %54
  br i1 %235, label %236, label %219, !llvm.loop !16

236:                                              ; preds = %216, %219, %49
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
!16 = distinct !{!16, !12}
