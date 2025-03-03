; ModuleID = '../data/hip_kernels/2824/189/main.cu'
source_filename = "../data/hip_kernels/2824/189/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@coef = protected addrspace(4) externally_initialized global [5 x float] zeroinitializer, align 16
@_ZZ11kernel_2dfdPfS_iiiE4line = internal unnamed_addr addrspace(3) global [24 x float] undef, align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast ([5 x float] addrspace(4)* @coef to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11kernel_2dfdPfS_iii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = mul nsw i32 %3, %2
  %16 = add i32 %14, %15
  %17 = shl nsw i32 %2, 2
  %18 = icmp slt i32 %3, %4
  br i1 %18, label %19, label %93

19:                                               ; preds = %5
  %20 = add nuw nsw i32 %13, 4
  %21 = shl i32 %2, 2
  %22 = sub i32 %16, %21
  %23 = zext i32 %22 to i64
  %24 = getelementptr inbounds float, float addrspace(1)* %1, i64 %23
  %25 = load float, float addrspace(1)* %24, align 4, !tbaa !7, !amdgpu.noclobber !5
  %26 = insertelement <9 x float> undef, float %25, i64 0
  %27 = mul nsw i32 %2, -3
  %28 = add i32 %27, %16
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %1, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !5
  %32 = insertelement <9 x float> %26, float %31, i64 1
  %33 = shl i32 %2, 1
  %34 = sub i32 %16, %33
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %1, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !5
  %38 = insertelement <9 x float> %32, float %37, i64 2
  %39 = sub i32 %16, %2
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %1, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !7, !amdgpu.noclobber !5
  %43 = insertelement <9 x float> %38, float %42, i64 3
  %44 = zext i32 %16 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %1, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  %47 = insertelement <9 x float> %43, float %46, i64 4
  %48 = add i32 %16, %2
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %1, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !7, !amdgpu.noclobber !5
  %52 = insertelement <9 x float> %47, float %51, i64 5
  %53 = shl nsw i32 %2, 1
  %54 = add i32 %53, %16
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %1, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !7, !amdgpu.noclobber !5
  %58 = insertelement <9 x float> %52, float %57, i64 6
  %59 = mul nsw i32 %2, 3
  %60 = add i32 %59, %16
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %1, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !7, !amdgpu.noclobber !5
  %64 = insertelement <9 x float> %58, float %63, i64 7
  %65 = icmp ult i32 %13, 4
  %66 = getelementptr inbounds [24 x float], [24 x float] addrspace(3)* @_ZZ11kernel_2dfdPfS_iiiE4line, i32 0, i32 %13
  %67 = add nuw nsw i32 %13, 20
  %68 = getelementptr inbounds [24 x float], [24 x float] addrspace(3)* @_ZZ11kernel_2dfdPfS_iiiE4line, i32 0, i32 %67
  %69 = getelementptr inbounds [24 x float], [24 x float] addrspace(3)* @_ZZ11kernel_2dfdPfS_iiiE4line, i32 0, i32 %20
  %70 = icmp ugt i32 %14, 3
  %71 = add nsw i32 %2, -4
  %72 = icmp ult i32 %14, %71
  %73 = select i1 %70, i1 %72, i1 false
  %74 = load float, float addrspace(4)* getelementptr inbounds ([5 x float], [5 x float] addrspace(4)* @coef, i64 0, i64 0), align 16
  %75 = load float, float addrspace(4)* getelementptr inbounds ([5 x float], [5 x float] addrspace(4)* @coef, i64 0, i64 1), align 4
  %76 = add nuw nsw i32 %13, 3
  %77 = getelementptr inbounds [24 x float], [24 x float] addrspace(3)* @_ZZ11kernel_2dfdPfS_iiiE4line, i32 0, i32 %76
  %78 = add nuw nsw i32 %13, 5
  %79 = getelementptr inbounds [24 x float], [24 x float] addrspace(3)* @_ZZ11kernel_2dfdPfS_iiiE4line, i32 0, i32 %78
  %80 = load float, float addrspace(4)* getelementptr inbounds ([5 x float], [5 x float] addrspace(4)* @coef, i64 0, i64 2), align 8
  %81 = add nuw nsw i32 %13, 2
  %82 = getelementptr inbounds [24 x float], [24 x float] addrspace(3)* @_ZZ11kernel_2dfdPfS_iiiE4line, i32 0, i32 %81
  %83 = add nuw nsw i32 %13, 6
  %84 = getelementptr inbounds [24 x float], [24 x float] addrspace(3)* @_ZZ11kernel_2dfdPfS_iiiE4line, i32 0, i32 %83
  %85 = load float, float addrspace(4)* getelementptr inbounds ([5 x float], [5 x float] addrspace(4)* @coef, i64 0, i64 3), align 4
  %86 = add nuw nsw i32 %13, 1
  %87 = getelementptr inbounds [24 x float], [24 x float] addrspace(3)* @_ZZ11kernel_2dfdPfS_iiiE4line, i32 0, i32 %86
  %88 = add nuw nsw i32 %13, 7
  %89 = getelementptr inbounds [24 x float], [24 x float] addrspace(3)* @_ZZ11kernel_2dfdPfS_iiiE4line, i32 0, i32 %88
  %90 = load float, float addrspace(4)* getelementptr inbounds ([5 x float], [5 x float] addrspace(4)* @coef, i64 0, i64 4), align 16
  %91 = add nuw nsw i32 %13, 8
  %92 = getelementptr inbounds [24 x float], [24 x float] addrspace(3)* @_ZZ11kernel_2dfdPfS_iiiE4line, i32 0, i32 %91
  br label %94

93:                                               ; preds = %165, %5
  ret void

94:                                               ; preds = %19, %165
  %95 = phi i32 [ %3, %19 ], [ %178, %165 ]
  %96 = phi i32 [ %16, %19 ], [ %177, %165 ]
  %97 = phi <9 x float> [ %64, %19 ], [ %176, %165 ]
  %98 = add i32 %96, %17
  %99 = zext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %1, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !7
  br i1 %65, label %102, label %111

102:                                              ; preds = %94
  %103 = add i32 %96, -4
  %104 = zext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %1, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7
  store float %106, float addrspace(3)* %66, align 4, !tbaa !7
  %107 = add i32 %96, 16
  %108 = zext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %1, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !7
  store float %110, float addrspace(3)* %68, align 4, !tbaa !7
  br label %111

111:                                              ; preds = %102, %94
  %112 = extractelement <9 x float> %97, i64 4
  store float %112, float addrspace(3)* %69, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %73, label %115, label %113

113:                                              ; preds = %111
  %114 = extractelement <9 x float> %97, i64 1
  br label %165

115:                                              ; preds = %111
  %116 = load float, float addrspace(3)* %69, align 4, !tbaa !7
  %117 = fmul contract float %74, %116
  %118 = fmul contract float %117, 2.000000e+00
  %119 = load float, float addrspace(3)* %77, align 4, !tbaa !7
  %120 = load float, float addrspace(3)* %79, align 4, !tbaa !7
  %121 = fadd contract float %119, %120
  %122 = fmul contract float %75, %121
  %123 = fadd contract float %118, %122
  %124 = load float, float addrspace(3)* %82, align 4, !tbaa !7
  %125 = load float, float addrspace(3)* %84, align 4, !tbaa !7
  %126 = fadd contract float %124, %125
  %127 = fmul contract float %80, %126
  %128 = fadd contract float %123, %127
  %129 = load float, float addrspace(3)* %87, align 4, !tbaa !7
  %130 = load float, float addrspace(3)* %89, align 4, !tbaa !7
  %131 = fadd contract float %129, %130
  %132 = fmul contract float %85, %131
  %133 = fadd contract float %128, %132
  %134 = load float, float addrspace(3)* %66, align 4, !tbaa !7
  %135 = load float, float addrspace(3)* %92, align 4, !tbaa !7
  %136 = fadd contract float %134, %135
  %137 = fmul contract float %90, %136
  %138 = fadd contract float %133, %137
  %139 = extractelement <9 x float> %97, i64 3
  %140 = extractelement <9 x float> %97, i64 5
  %141 = fadd contract float %139, %140
  %142 = fmul contract float %141, %75
  %143 = fadd contract float %138, %142
  %144 = extractelement <9 x float> %97, i64 2
  %145 = extractelement <9 x float> %97, i64 6
  %146 = fadd contract float %144, %145
  %147 = fmul contract float %146, %80
  %148 = fadd contract float %143, %147
  %149 = extractelement <9 x float> %97, i64 1
  %150 = extractelement <9 x float> %97, i64 7
  %151 = fadd contract float %149, %150
  %152 = fmul contract float %151, %85
  %153 = fadd contract float %148, %152
  %154 = extractelement <9 x float> %97, i64 0
  %155 = fadd contract float %154, %101
  %156 = fmul contract float %155, %90
  %157 = fadd contract float %153, %156
  %158 = fadd contract float %112, %112
  %159 = zext i32 %96 to i64
  %160 = getelementptr inbounds float, float addrspace(1)* %0, i64 %159
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !7
  %162 = fsub contract float %158, %161
  %163 = fmul contract float %157, 0x3FBEB851E0000000
  %164 = fadd contract float %163, %162
  store float %164, float addrspace(1)* %160, align 4, !tbaa !7
  br label %165

165:                                              ; preds = %113, %115
  %166 = phi float [ %114, %113 ], [ %149, %115 ]
  %167 = insertelement <9 x float> poison, float %166, i64 0
  %168 = insertelement <9 x float> %167, float %101, i64 8
  %169 = shufflevector <9 x float> %168, <9 x float> %97, <9 x i32> <i32 0, i32 11, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 8>
  %170 = shufflevector <9 x float> %169, <9 x float> %97, <9 x i32> <i32 0, i32 1, i32 12, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 8>
  %171 = shufflevector <9 x float> %170, <9 x float> %97, <9 x i32> <i32 0, i32 1, i32 2, i32 13, i32 undef, i32 undef, i32 undef, i32 undef, i32 8>
  %172 = shufflevector <9 x float> %171, <9 x float> %97, <9 x i32> <i32 0, i32 1, i32 2, i32 3, i32 14, i32 undef, i32 undef, i32 undef, i32 8>
  %173 = shufflevector <9 x float> %172, <9 x float> %97, <9 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 15, i32 undef, i32 undef, i32 8>
  %174 = extractelement <9 x float> %97, i64 7
  %175 = insertelement <9 x float> %173, float %174, i64 6
  %176 = insertelement <9 x float> %175, float %101, i64 7
  %177 = add i32 %96, %2
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %178 = add nsw i32 %95, 1
  %179 = icmp slt i32 %178, %4
  br i1 %179, label %94, label %93, !llvm.loop !11
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
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!"llvm.loop.unroll.count", i32 9}
