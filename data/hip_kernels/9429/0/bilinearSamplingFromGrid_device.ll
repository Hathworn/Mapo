; ModuleID = '../data/hip_kernels/9429/0/main.cu'
source_filename = "../data/hip_kernels/9429/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ24bilinearSamplingFromGridPfiiiiS_iiiiS_iiiiiiiiE8gridData = internal unnamed_addr addrspace(3) global [32 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z24bilinearSamplingFromGridPfiiiiS_iiiiS_iiiiiiii(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture readonly %5, i32 %6, i32 %7, i32 %8, i32 %9, float addrspace(1)* nocapture writeonly %10, i32 %11, i32 %12, i32 %13, i32 %14, i32 %15, i32 %16, i32 %17, i32 %18) local_unnamed_addr #0 {
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %21 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %23 = getelementptr i8, i8 addrspace(4)* %21, i64 6
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 2, !range !4, !invariant.load !5
  %26 = zext i16 %25 to i32
  %27 = mul i32 %20, %26
  %28 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %29 = add i32 %27, %28
  %30 = icmp slt i32 %29, %18
  %31 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %32 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %33 = icmp eq i32 %28, 0
  br i1 %33, label %34, label %49

34:                                               ; preds = %19
  %35 = lshr i32 %31, 1
  %36 = add i32 %27, %35
  %37 = icmp ult i32 %36, %18
  br i1 %37, label %38, label %49

38:                                               ; preds = %34
  %39 = mul nsw i32 %32, %6
  %40 = mul nsw i32 %22, %8
  %41 = mul nsw i32 %29, %9
  %42 = add i32 %39, %31
  %43 = add i32 %42, %40
  %44 = add i32 %43, %41
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %5, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7, !amdgpu.noclobber !5
  %48 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ24bilinearSamplingFromGridPfiiiiS_iiiiS_iiiiiiiiE8gridData, i32 0, i32 %31
  store float %47, float addrspace(3)* %48, align 4, !tbaa !7
  br label %49

49:                                               ; preds = %38, %34, %19
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %30, label %50, label %166

50:                                               ; preds = %49
  %51 = shl nuw nsw i32 %28, 1
  %52 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ24bilinearSamplingFromGridPfiiiiS_iiiiS_iiiiiiiiE8gridData, i32 0, i32 %51
  %53 = load float, float addrspace(3)* %52, align 8, !tbaa !7
  %54 = add nuw nsw i32 %51, 1
  %55 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ24bilinearSamplingFromGridPfiiiiS_iiiiS_iiiiiiiiE8gridData, i32 0, i32 %54
  %56 = load float, float addrspace(3)* %55, align 4, !tbaa !7
  %57 = fadd contract float %56, 1.000000e+00
  %58 = add nsw i32 %17, -1
  %59 = sitofp i32 %58 to float
  %60 = fmul contract float %57, %59
  %61 = fmul contract float %60, 5.000000e-01
  %62 = tail call float @llvm.floor.f32(float %61)
  %63 = fptosi float %62 to i32
  %64 = sitofp i32 %63 to float
  %65 = fsub contract float %64, %61
  %66 = fadd contract float %65, 1.000000e+00
  %67 = fadd contract float %53, 1.000000e+00
  %68 = add nsw i32 %16, -1
  %69 = sitofp i32 %68 to float
  %70 = fmul contract float %67, %69
  %71 = fmul contract float %70, 5.000000e-01
  %72 = tail call float @llvm.floor.f32(float %71)
  %73 = fptosi float %72 to i32
  %74 = sitofp i32 %73 to float
  %75 = fsub contract float %74, %71
  %76 = fadd contract float %75, 1.000000e+00
  %77 = mul nsw i32 %32, %11
  %78 = mul nsw i32 %22, %13
  %79 = add nsw i32 %78, %77
  %80 = mul nsw i32 %29, %14
  %81 = add nsw i32 %79, %80
  %82 = mul nsw i32 %32, %1
  %83 = mul nsw i32 %73, %3
  %84 = add nsw i32 %83, %82
  %85 = mul nsw i32 %63, %4
  %86 = add nsw i32 %84, %85
  %87 = add nsw i32 %86, %3
  %88 = icmp sgt i32 %63, -1
  %89 = icmp slt i32 %63, %17
  %90 = select i1 %88, i1 %89, i1 false
  %91 = icmp sgt i32 %73, -1
  %92 = icmp slt i32 %73, %16
  %93 = select i1 %90, i1 %91, i1 false
  %94 = select i1 %93, i1 %92, i1 false
  %95 = icmp sgt i32 %63, -2
  %96 = icmp sgt i32 %58, %63
  %97 = select i1 %95, i1 %96, i1 false
  %98 = select i1 %97, i1 %91, i1 false
  %99 = select i1 %98, i1 %92, i1 false
  %100 = icmp sgt i32 %73, -2
  %101 = icmp sgt i32 %68, %73
  %102 = select i1 %90, i1 %100, i1 false
  %103 = select i1 %102, i1 %101, i1 false
  %104 = select i1 %97, i1 %100, i1 false
  %105 = select i1 %104, i1 %101, i1 false
  %106 = icmp slt i32 %31, %15
  br i1 %106, label %107, label %166

107:                                              ; preds = %50
  %108 = fmul contract float %76, %66
  %109 = fsub contract float 1.000000e+00, %66
  %110 = fmul contract float %76, %109
  %111 = fsub contract float 1.000000e+00, %76
  %112 = fmul contract float %66, %111
  %113 = fmul contract float %111, %109
  %114 = getelementptr i8, i8 addrspace(4)* %21, i64 4
  %115 = bitcast i8 addrspace(4)* %114 to i16 addrspace(4)*
  %116 = load i16, i16 addrspace(4)* %115, align 4, !range !4, !invariant.load !5
  %117 = zext i16 %116 to i32
  br label %118

118:                                              ; preds = %107, %152
  %119 = phi i32 [ %31, %107 ], [ %164, %152 ]
  %120 = phi float [ 0.000000e+00, %107 ], [ %130, %152 ]
  %121 = phi float [ 0.000000e+00, %107 ], [ %138, %152 ]
  %122 = phi float [ 0.000000e+00, %107 ], [ %153, %152 ]
  %123 = phi float [ 0.000000e+00, %107 ], [ %145, %152 ]
  br i1 %94, label %124, label %129

124:                                              ; preds = %118
  %125 = add nsw i32 %119, %86
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %0, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !7
  br label %129

129:                                              ; preds = %124, %118
  %130 = phi float [ %128, %124 ], [ %120, %118 ]
  br i1 %99, label %131, label %137

131:                                              ; preds = %129
  %132 = add i32 %119, %86
  %133 = add i32 %132, %4
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %0, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !7
  br label %137

137:                                              ; preds = %131, %129
  %138 = phi float [ %136, %131 ], [ %121, %129 ]
  br i1 %103, label %139, label %144

139:                                              ; preds = %137
  %140 = add nsw i32 %119, %87
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %0, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !7
  br label %144

144:                                              ; preds = %139, %137
  %145 = phi float [ %143, %139 ], [ %123, %137 ]
  br i1 %105, label %146, label %152

146:                                              ; preds = %144
  %147 = add i32 %119, %87
  %148 = add i32 %147, %4
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %0, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !7
  br label %152

152:                                              ; preds = %146, %144
  %153 = phi float [ %151, %146 ], [ %122, %144 ]
  %154 = fmul contract float %108, %130
  %155 = fmul contract float %110, %138
  %156 = fadd contract float %154, %155
  %157 = fmul contract float %112, %145
  %158 = fadd contract float %156, %157
  %159 = fmul contract float %113, %153
  %160 = fadd contract float %158, %159
  %161 = add nsw i32 %81, %119
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds float, float addrspace(1)* %10, i64 %162
  store float %160, float addrspace(1)* %163, align 4, !tbaa !7
  %164 = add i32 %119, %117
  %165 = icmp slt i32 %164, %15
  br i1 %165, label %118, label %166, !llvm.loop !11

166:                                              ; preds = %152, %50, %49
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
