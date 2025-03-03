; ModuleID = '../data/hip_kernels/14424/5/main.cu'
source_filename = "../data/hip_kernels/14424/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z18convn_valid_kernelPfS_S_iiii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %24 = add i32 %22, %23
  %25 = sub nsw i32 %3, %5
  %26 = add nsw i32 %25, 1
  %27 = icmp sgt i32 %16, %25
  %28 = sub nsw i32 %4, %6
  %29 = icmp sgt i32 %24, %28
  %30 = select i1 %27, i1 true, i1 %29
  br i1 %30, label %176, label %31

31:                                               ; preds = %7
  %32 = add nsw i32 %5, -1
  %33 = add nsw i32 %32, %16
  %34 = add nsw i32 %6, -1
  %35 = add nsw i32 %34, %24
  %36 = icmp sgt i32 %6, 0
  br i1 %36, label %37, label %51

37:                                               ; preds = %31
  %38 = icmp sgt i32 %5, 0
  %39 = and i32 %5, 7
  %40 = icmp ult i32 %5, 8
  %41 = and i32 %5, -8
  %42 = icmp eq i32 %39, 0
  br label %43

43:                                               ; preds = %37, %78
  %44 = phi i32 [ 0, %37 ], [ %80, %78 ]
  %45 = phi float [ 0.000000e+00, %37 ], [ %79, %78 ]
  br i1 %38, label %46, label %78

46:                                               ; preds = %43
  %47 = mul nsw i32 %44, %5
  %48 = sub i32 %35, %44
  %49 = mul nsw i32 %48, %3
  %50 = add i32 %33, %49
  br i1 %40, label %57, label %82

51:                                               ; preds = %78, %31
  %52 = phi float [ 0.000000e+00, %31 ], [ %79, %78 ]
  %53 = mul nsw i32 %24, %26
  %54 = add nsw i32 %53, %16
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  store float %52, float addrspace(1)* %56, align 4, !tbaa !7
  br label %176

57:                                               ; preds = %82, %46
  %58 = phi float [ undef, %46 ], [ %172, %82 ]
  %59 = phi i32 [ 0, %46 ], [ %173, %82 ]
  %60 = phi float [ %45, %46 ], [ %172, %82 ]
  br i1 %42, label %78, label %61

61:                                               ; preds = %57, %61
  %62 = phi i32 [ %75, %61 ], [ %59, %57 ]
  %63 = phi float [ %74, %61 ], [ %60, %57 ]
  %64 = phi i32 [ %76, %61 ], [ 0, %57 ]
  %65 = add nsw i32 %62, %47
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %2, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !7, !amdgpu.noclobber !5
  %69 = sub i32 %50, %62
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %1, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7, !amdgpu.noclobber !5
  %73 = fmul contract float %68, %72
  %74 = fadd contract float %63, %73
  %75 = add nuw nsw i32 %62, 1
  %76 = add i32 %64, 1
  %77 = icmp eq i32 %76, %39
  br i1 %77, label %78, label %61, !llvm.loop !11

78:                                               ; preds = %57, %61, %43
  %79 = phi float [ %45, %43 ], [ %58, %57 ], [ %74, %61 ]
  %80 = add nuw nsw i32 %44, 1
  %81 = icmp eq i32 %80, %6
  br i1 %81, label %51, label %43, !llvm.loop !13

82:                                               ; preds = %46, %82
  %83 = phi i32 [ %173, %82 ], [ 0, %46 ]
  %84 = phi float [ %172, %82 ], [ %45, %46 ]
  %85 = phi i32 [ %174, %82 ], [ 0, %46 ]
  %86 = add nsw i32 %83, %47
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %2, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !7, !amdgpu.noclobber !5
  %90 = sub i32 %50, %83
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %1, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !7, !amdgpu.noclobber !5
  %94 = fmul contract float %89, %93
  %95 = fadd contract float %84, %94
  %96 = or i32 %83, 1
  %97 = add nsw i32 %96, %47
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %2, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7, !amdgpu.noclobber !5
  %101 = sub i32 %50, %96
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %1, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !7, !amdgpu.noclobber !5
  %105 = fmul contract float %100, %104
  %106 = fadd contract float %95, %105
  %107 = or i32 %83, 2
  %108 = add nsw i32 %107, %47
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %2, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !7, !amdgpu.noclobber !5
  %112 = sub i32 %50, %107
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %1, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !7, !amdgpu.noclobber !5
  %116 = fmul contract float %111, %115
  %117 = fadd contract float %106, %116
  %118 = or i32 %83, 3
  %119 = add nsw i32 %118, %47
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %2, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7, !amdgpu.noclobber !5
  %123 = sub i32 %50, %118
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %1, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !7, !amdgpu.noclobber !5
  %127 = fmul contract float %122, %126
  %128 = fadd contract float %117, %127
  %129 = or i32 %83, 4
  %130 = add nsw i32 %129, %47
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %2, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !7, !amdgpu.noclobber !5
  %134 = sub i32 %50, %129
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %1, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !7, !amdgpu.noclobber !5
  %138 = fmul contract float %133, %137
  %139 = fadd contract float %128, %138
  %140 = or i32 %83, 5
  %141 = add nsw i32 %140, %47
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %2, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !7, !amdgpu.noclobber !5
  %145 = sub i32 %50, %140
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %1, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !7, !amdgpu.noclobber !5
  %149 = fmul contract float %144, %148
  %150 = fadd contract float %139, %149
  %151 = or i32 %83, 6
  %152 = add nsw i32 %151, %47
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %2, i64 %153
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !7, !amdgpu.noclobber !5
  %156 = sub i32 %50, %151
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds float, float addrspace(1)* %1, i64 %157
  %159 = load float, float addrspace(1)* %158, align 4, !tbaa !7, !amdgpu.noclobber !5
  %160 = fmul contract float %155, %159
  %161 = fadd contract float %150, %160
  %162 = or i32 %83, 7
  %163 = add nsw i32 %162, %47
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %2, i64 %164
  %166 = load float, float addrspace(1)* %165, align 4, !tbaa !7, !amdgpu.noclobber !5
  %167 = sub i32 %50, %162
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds float, float addrspace(1)* %1, i64 %168
  %170 = load float, float addrspace(1)* %169, align 4, !tbaa !7, !amdgpu.noclobber !5
  %171 = fmul contract float %166, %170
  %172 = fadd contract float %161, %171
  %173 = add nuw nsw i32 %83, 8
  %174 = add i32 %85, 8
  %175 = icmp eq i32 %174, %41
  br i1 %175, label %57, label %82, !llvm.loop !15

176:                                              ; preds = %7, %51
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
