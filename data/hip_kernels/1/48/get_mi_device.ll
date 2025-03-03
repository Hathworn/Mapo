; ModuleID = '../data/hip_kernels/1/48/main.cu'
source_filename = "../data/hip_kernels/1/48/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z6get_miiiiPfiS_iS_iS_S_i(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, i32 %4, float addrspace(1)* nocapture readonly %5, i32 %6, float addrspace(1)* nocapture readonly %7, i32 %8, float addrspace(1)* nocapture readonly %9, float addrspace(1)* nocapture writeonly %10, i32 %11) local_unnamed_addr #0 {
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %21 = add i32 %19, %20
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %23 = getelementptr i8, i8 addrspace(4)* %13, i64 6
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 2, !range !4, !invariant.load !5
  %26 = zext i16 %25 to i32
  %27 = mul i32 %22, %26
  %28 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %29 = add i32 %27, %28
  %30 = icmp slt i32 %21, %2
  %31 = icmp slt i32 %29, %6
  %32 = select i1 %30, i1 %31, i1 false
  br i1 %32, label %33, label %206

33:                                               ; preds = %12
  %34 = mul nsw i32 %21, %4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %3, i64 %35
  %37 = mul nsw i32 %29, %8
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %7, i64 %38
  %40 = icmp sgt i32 %0, 0
  br i1 %40, label %41, label %51

41:                                               ; preds = %33
  %42 = icmp sgt i32 %1, 0
  %43 = sitofp i32 %1 to float
  %44 = and i32 %1, 7
  %45 = icmp ult i32 %1, 8
  %46 = and i32 %1, -8
  %47 = icmp eq i32 %44, 0
  br label %48

48:                                               ; preds = %41, %69
  %49 = phi i32 [ 0, %41 ], [ %70, %69 ]
  %50 = phi float [ 0.000000e+00, %41 ], [ %101, %69 ]
  br label %65

51:                                               ; preds = %69, %33
  %52 = phi float [ 0.000000e+00, %33 ], [ %101, %69 ]
  %53 = sext i32 %21 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %5, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7, !amdgpu.noclobber !5
  %56 = sext i32 %29 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %9, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !7, !amdgpu.noclobber !5
  %59 = fadd contract float %55, %58
  %60 = fadd contract float %52, %59
  %61 = mul nsw i32 %29, %11
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %10, i64 %62
  %64 = getelementptr inbounds float, float addrspace(1)* %63, i64 %53
  store float %60, float addrspace(1)* %64, align 4, !tbaa !7
  br label %206

65:                                               ; preds = %48, %94
  %66 = phi i32 [ %102, %94 ], [ 0, %48 ]
  %67 = phi float [ %101, %94 ], [ %50, %48 ]
  br i1 %42, label %68, label %94

68:                                               ; preds = %65
  br i1 %45, label %72, label %104

69:                                               ; preds = %94
  %70 = add nuw nsw i32 %49, 1
  %71 = icmp eq i32 %70, %0
  br i1 %71, label %51, label %48, !llvm.loop !11

72:                                               ; preds = %104, %68
  %73 = phi float [ undef, %68 ], [ %202, %104 ]
  %74 = phi i32 [ 0, %68 ], [ %203, %104 ]
  %75 = phi float [ 0.000000e+00, %68 ], [ %202, %104 ]
  br i1 %47, label %94, label %76

76:                                               ; preds = %72, %76
  %77 = phi i32 [ %91, %76 ], [ %74, %72 ]
  %78 = phi float [ %90, %76 ], [ %75, %72 ]
  %79 = phi i32 [ %92, %76 ], [ 0, %72 ]
  %80 = mul nsw i32 %77, %0
  %81 = add nsw i32 %80, %49
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %36, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7, !amdgpu.noclobber !5
  %85 = add nsw i32 %80, %66
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %39, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7, !amdgpu.noclobber !5
  %89 = fmul contract float %84, %88
  %90 = fadd contract float %78, %89
  %91 = add nuw nsw i32 %77, 1
  %92 = add i32 %79, 1
  %93 = icmp eq i32 %92, %44
  br i1 %93, label %94, label %76, !llvm.loop !13

94:                                               ; preds = %72, %76, %65
  %95 = phi float [ 0.000000e+00, %65 ], [ %73, %72 ], [ %90, %76 ]
  %96 = fdiv contract float %95, %43
  %97 = fcmp contract ugt float %96, 0.000000e+00
  %98 = tail call float @llvm.log2.f32(float %96)
  %99 = select i1 %97, float %98, float 0.000000e+00
  %100 = fmul contract float %96, %99
  %101 = fadd contract float %67, %100
  %102 = add nuw nsw i32 %66, 1
  %103 = icmp eq i32 %102, %0
  br i1 %103, label %69, label %65, !llvm.loop !15

104:                                              ; preds = %68, %104
  %105 = phi i32 [ %203, %104 ], [ 0, %68 ]
  %106 = phi float [ %202, %104 ], [ 0.000000e+00, %68 ]
  %107 = phi i32 [ %204, %104 ], [ 0, %68 ]
  %108 = mul nsw i32 %105, %0
  %109 = add nsw i32 %108, %49
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %36, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !7, !amdgpu.noclobber !5
  %113 = add nsw i32 %108, %66
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %39, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7, !amdgpu.noclobber !5
  %117 = fmul contract float %112, %116
  %118 = fadd contract float %106, %117
  %119 = or i32 %105, 1
  %120 = mul nsw i32 %119, %0
  %121 = add nsw i32 %120, %49
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %36, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !7, !amdgpu.noclobber !5
  %125 = add nsw i32 %120, %66
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %39, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !7, !amdgpu.noclobber !5
  %129 = fmul contract float %124, %128
  %130 = fadd contract float %118, %129
  %131 = or i32 %105, 2
  %132 = mul nsw i32 %131, %0
  %133 = add nsw i32 %132, %49
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %36, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !7, !amdgpu.noclobber !5
  %137 = add nsw i32 %132, %66
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %39, i64 %138
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !7, !amdgpu.noclobber !5
  %141 = fmul contract float %136, %140
  %142 = fadd contract float %130, %141
  %143 = or i32 %105, 3
  %144 = mul nsw i32 %143, %0
  %145 = add nsw i32 %144, %49
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %36, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !7, !amdgpu.noclobber !5
  %149 = add nsw i32 %144, %66
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds float, float addrspace(1)* %39, i64 %150
  %152 = load float, float addrspace(1)* %151, align 4, !tbaa !7, !amdgpu.noclobber !5
  %153 = fmul contract float %148, %152
  %154 = fadd contract float %142, %153
  %155 = or i32 %105, 4
  %156 = mul nsw i32 %155, %0
  %157 = add nsw i32 %156, %49
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %36, i64 %158
  %160 = load float, float addrspace(1)* %159, align 4, !tbaa !7, !amdgpu.noclobber !5
  %161 = add nsw i32 %156, %66
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds float, float addrspace(1)* %39, i64 %162
  %164 = load float, float addrspace(1)* %163, align 4, !tbaa !7, !amdgpu.noclobber !5
  %165 = fmul contract float %160, %164
  %166 = fadd contract float %154, %165
  %167 = or i32 %105, 5
  %168 = mul nsw i32 %167, %0
  %169 = add nsw i32 %168, %49
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds float, float addrspace(1)* %36, i64 %170
  %172 = load float, float addrspace(1)* %171, align 4, !tbaa !7, !amdgpu.noclobber !5
  %173 = add nsw i32 %168, %66
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds float, float addrspace(1)* %39, i64 %174
  %176 = load float, float addrspace(1)* %175, align 4, !tbaa !7, !amdgpu.noclobber !5
  %177 = fmul contract float %172, %176
  %178 = fadd contract float %166, %177
  %179 = or i32 %105, 6
  %180 = mul nsw i32 %179, %0
  %181 = add nsw i32 %180, %49
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds float, float addrspace(1)* %36, i64 %182
  %184 = load float, float addrspace(1)* %183, align 4, !tbaa !7, !amdgpu.noclobber !5
  %185 = add nsw i32 %180, %66
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds float, float addrspace(1)* %39, i64 %186
  %188 = load float, float addrspace(1)* %187, align 4, !tbaa !7, !amdgpu.noclobber !5
  %189 = fmul contract float %184, %188
  %190 = fadd contract float %178, %189
  %191 = or i32 %105, 7
  %192 = mul nsw i32 %191, %0
  %193 = add nsw i32 %192, %49
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds float, float addrspace(1)* %36, i64 %194
  %196 = load float, float addrspace(1)* %195, align 4, !tbaa !7, !amdgpu.noclobber !5
  %197 = add nsw i32 %192, %66
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds float, float addrspace(1)* %39, i64 %198
  %200 = load float, float addrspace(1)* %199, align 4, !tbaa !7, !amdgpu.noclobber !5
  %201 = fmul contract float %196, %200
  %202 = fadd contract float %190, %201
  %203 = add nuw nsw i32 %105, 8
  %204 = add i32 %107, 8
  %205 = icmp eq i32 %204, %46
  br i1 %205, label %72, label %104, !llvm.loop !16

206:                                              ; preds = %12, %51
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
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
!16 = distinct !{!16, !12}
