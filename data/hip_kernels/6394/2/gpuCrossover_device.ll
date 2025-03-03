; ModuleID = '../data/hip_kernels/6394/2/main.cu'
source_filename = "../data/hip_kernels/6394/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.hiprandState = type { %"class.rocrand_device::xorwow_engine" }
%"class.rocrand_device::xorwow_engine" = type { %"struct.rocrand_device::xorwow_engine::xorwow_state" }
%"struct.rocrand_device::xorwow_engine::xorwow_state" = type { i32, i32, i32, float, double, [5 x i32] }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12gpuCrossoverPfP12hiprandStateiiif(float addrspace(1)* nocapture %0, %struct.hiprandState addrspace(1)* nocapture %1, i32 %2, i32 %3, i32 %4, float %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 0, i32 0, i32 0, i32 0
  %17 = load i32, i32 addrspace(1)* %16, align 8, !amdgpu.noclobber !5
  %18 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 0, i32 0, i32 0, i32 5, i64 0
  %19 = load i32, i32 addrspace(1)* %18, align 8, !amdgpu.noclobber !5
  %20 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 0, i32 0, i32 0, i32 5, i64 1
  %21 = load i32, i32 addrspace(1)* %20, align 4, !amdgpu.noclobber !5
  %22 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 0, i32 0, i32 0, i32 5, i64 2
  %23 = load i32, i32 addrspace(1)* %22, align 8, !amdgpu.noclobber !5
  %24 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 0, i32 0, i32 0, i32 5, i64 3
  %25 = load i32, i32 addrspace(1)* %24, align 4, !amdgpu.noclobber !5
  %26 = getelementptr inbounds %struct.hiprandState, %struct.hiprandState addrspace(1)* %1, i64 0, i32 0, i32 0, i32 5, i64 4
  %27 = load i32, i32 addrspace(1)* %26, align 8, !amdgpu.noclobber !5
  %28 = lshr i32 %19, 2
  %29 = xor i32 %28, %19
  %30 = shl i32 %27, 4
  %31 = shl i32 %29, 1
  %32 = xor i32 %31, %30
  %33 = xor i32 %32, %29
  %34 = xor i32 %33, %27
  %35 = add i32 %17, 362437
  store i32 %35, i32 addrspace(1)* %16, align 8
  store i32 %21, i32 addrspace(1)* %18, align 8
  store i32 %23, i32 addrspace(1)* %20, align 4
  store i32 %25, i32 addrspace(1)* %22, align 8
  store i32 %27, i32 addrspace(1)* %24, align 4
  store i32 %34, i32 addrspace(1)* %26, align 8
  %36 = sitofp i32 %2 to float
  %37 = shl nsw i32 %15, 1
  %38 = mul nsw i32 %37, %2
  %39 = add nsw i32 %38, %2
  %40 = add nsw i32 %39, %2
  %41 = mul nsw i32 %3, %2
  %42 = icmp slt i32 %40, %41
  br i1 %42, label %43, label %74

43:                                               ; preds = %6
  %44 = add i32 %34, %35
  %45 = uitofp i32 %44 to float
  %46 = fmul contract float %45, 0x3DF0000000000000
  %47 = fadd contract float %46, 0x3DF0000000000000
  %48 = fmul contract float %47, %36
  %49 = fptosi float %48 to i32
  %50 = icmp slt i32 %49, %2
  br i1 %50, label %51, label %74

51:                                               ; preds = %43
  %52 = add nsw i32 %38, %49
  %53 = add nsw i32 %39, %49
  %54 = sext i32 %52 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %0, i64 %54
  %56 = sext i32 %53 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %0, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !7
  br label %59

59:                                               ; preds = %59, %51
  %60 = phi float [ %58, %51 ], [ %64, %59 ]
  %61 = phi i32 [ %49, %51 ], [ %65, %59 ]
  %62 = load float, float addrspace(1)* %55, align 4, !tbaa !7
  %63 = fptosi float %62 to i32
  store float %60, float addrspace(1)* %55, align 4, !tbaa !7
  %64 = sitofp i32 %63 to float
  store float %64, float addrspace(1)* %57, align 4, !tbaa !7
  %65 = add nsw i32 %61, 1
  %66 = icmp slt i32 %65, %2
  br i1 %66, label %59, label %67, !llvm.loop !11

67:                                               ; preds = %59
  %68 = load i32, i32 addrspace(1)* %16, align 8
  %69 = load i32, i32 addrspace(1)* %18, align 8
  %70 = load i32, i32 addrspace(1)* %20, align 4
  %71 = load i32, i32 addrspace(1)* %22, align 8
  %72 = load i32, i32 addrspace(1)* %24, align 4
  %73 = load i32, i32 addrspace(1)* %26, align 8
  br label %74

74:                                               ; preds = %67, %43, %6
  %75 = phi i32 [ %73, %67 ], [ %34, %43 ], [ %34, %6 ]
  %76 = phi i32 [ %72, %67 ], [ %27, %43 ], [ %27, %6 ]
  %77 = phi i32 [ %71, %67 ], [ %25, %43 ], [ %25, %6 ]
  %78 = phi i32 [ %70, %67 ], [ %23, %43 ], [ %23, %6 ]
  %79 = phi i32 [ %69, %67 ], [ %21, %43 ], [ %21, %6 ]
  %80 = phi i32 [ %68, %67 ], [ %35, %43 ], [ %35, %6 ]
  %81 = lshr i32 %79, 2
  %82 = xor i32 %81, %79
  %83 = shl i32 %75, 4
  %84 = shl i32 %82, 1
  %85 = xor i32 %84, %83
  %86 = xor i32 %85, %82
  %87 = xor i32 %86, %75
  %88 = add i32 %80, 362437
  %89 = add i32 %87, %88
  %90 = uitofp i32 %89 to float
  %91 = fmul contract float %90, 0x3DF0000000000000
  %92 = fadd contract float %91, 0x3DF0000000000000
  store i32 %88, i32 addrspace(1)* %16, align 8
  store i32 %78, i32 addrspace(1)* %18, align 8
  store i32 %77, i32 addrspace(1)* %20, align 4
  store i32 %76, i32 addrspace(1)* %22, align 8
  store i32 %75, i32 addrspace(1)* %24, align 4
  store i32 %87, i32 addrspace(1)* %26, align 8
  %93 = fmul contract float %92, 1.000000e+02
  %94 = fptosi float %93 to i32
  %95 = sitofp i32 %94 to float
  %96 = fmul contract float %5, 1.000000e+02
  %97 = fcmp contract ogt float %96, %95
  br i1 %97, label %98, label %203

98:                                               ; preds = %74
  %99 = lshr i32 %78, 2
  %100 = xor i32 %99, %78
  %101 = shl i32 %87, 4
  %102 = shl i32 %100, 1
  %103 = xor i32 %102, %101
  %104 = xor i32 %103, %100
  %105 = xor i32 %104, %87
  %106 = add i32 %80, 724874
  %107 = add i32 %105, %106
  %108 = uitofp i32 %107 to float
  %109 = fmul contract float %108, 0x3DF0000000000000
  %110 = fadd contract float %109, 0x3DF0000000000000
  store i32 %106, i32 addrspace(1)* %16, align 8
  store i32 %77, i32 addrspace(1)* %18, align 8
  store i32 %76, i32 addrspace(1)* %20, align 4
  store i32 %75, i32 addrspace(1)* %22, align 8
  store i32 %87, i32 addrspace(1)* %24, align 4
  store i32 %105, i32 addrspace(1)* %26, align 8
  %111 = sdiv i32 %2, 4
  %112 = sitofp i32 %111 to float
  %113 = fmul contract float %110, %112
  %114 = fptosi float %113 to i32
  %115 = icmp sgt i32 %114, 0
  br i1 %115, label %116, label %203

116:                                              ; preds = %98
  %117 = and i32 %114, 1
  %118 = icmp eq i32 %114, 1
  br i1 %118, label %175, label %119

119:                                              ; preds = %116
  %120 = and i32 %114, -2
  br label %121

121:                                              ; preds = %121, %119
  %122 = phi i32 [ 0, %119 ], [ %173, %121 ]
  %123 = load i32, i32 addrspace(1)* %16, align 8
  %124 = load i32, i32 addrspace(1)* %18, align 8
  %125 = load i32, i32 addrspace(1)* %20, align 4
  %126 = load i32, i32 addrspace(1)* %22, align 8
  %127 = load i32, i32 addrspace(1)* %24, align 4
  %128 = load i32, i32 addrspace(1)* %26, align 8
  %129 = lshr i32 %124, 2
  %130 = xor i32 %129, %124
  %131 = shl i32 %128, 4
  %132 = shl i32 %130, 1
  %133 = xor i32 %132, %131
  %134 = xor i32 %133, %130
  %135 = xor i32 %134, %128
  %136 = add i32 %123, 362437
  %137 = add i32 %135, %136
  %138 = uitofp i32 %137 to float
  %139 = fmul contract float %138, 0x3DF0000000000000
  %140 = fadd contract float %139, 0x3DF0000000000000
  store i32 %136, i32 addrspace(1)* %16, align 8
  store i32 %125, i32 addrspace(1)* %18, align 8
  store i32 %126, i32 addrspace(1)* %20, align 4
  store i32 %127, i32 addrspace(1)* %22, align 8
  store i32 %128, i32 addrspace(1)* %24, align 4
  store i32 %135, i32 addrspace(1)* %26, align 8
  %141 = fmul contract float %140, %36
  %142 = fptosi float %141 to i32
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %0, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !7
  %146 = fcmp contract oeq float %145, 1.000000e+00
  %147 = select i1 %146, float 0.000000e+00, float 1.000000e+00
  store float %147, float addrspace(1)* %144, align 4, !tbaa !7
  %148 = load i32, i32 addrspace(1)* %16, align 8
  %149 = load i32, i32 addrspace(1)* %18, align 8
  %150 = load i32, i32 addrspace(1)* %20, align 4
  %151 = load i32, i32 addrspace(1)* %22, align 8
  %152 = load i32, i32 addrspace(1)* %24, align 4
  %153 = load i32, i32 addrspace(1)* %26, align 8
  %154 = lshr i32 %149, 2
  %155 = xor i32 %154, %149
  %156 = shl i32 %153, 4
  %157 = shl i32 %155, 1
  %158 = xor i32 %157, %156
  %159 = xor i32 %158, %155
  %160 = xor i32 %159, %153
  %161 = add i32 %148, 362437
  %162 = add i32 %160, %161
  %163 = uitofp i32 %162 to float
  %164 = fmul contract float %163, 0x3DF0000000000000
  %165 = fadd contract float %164, 0x3DF0000000000000
  store i32 %161, i32 addrspace(1)* %16, align 8
  store i32 %150, i32 addrspace(1)* %18, align 8
  store i32 %151, i32 addrspace(1)* %20, align 4
  store i32 %152, i32 addrspace(1)* %22, align 8
  store i32 %153, i32 addrspace(1)* %24, align 4
  store i32 %160, i32 addrspace(1)* %26, align 8
  %166 = fmul contract float %165, %36
  %167 = fptosi float %166 to i32
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds float, float addrspace(1)* %0, i64 %168
  %170 = load float, float addrspace(1)* %169, align 4, !tbaa !7
  %171 = fcmp contract oeq float %170, 1.000000e+00
  %172 = select i1 %171, float 0.000000e+00, float 1.000000e+00
  store float %172, float addrspace(1)* %169, align 4, !tbaa !7
  %173 = add i32 %122, 2
  %174 = icmp eq i32 %173, %120
  br i1 %174, label %175, label %121, !llvm.loop !13

175:                                              ; preds = %121, %116
  %176 = icmp eq i32 %117, 0
  br i1 %176, label %203, label %177

177:                                              ; preds = %175
  %178 = load i32, i32 addrspace(1)* %16, align 8
  %179 = load i32, i32 addrspace(1)* %18, align 8
  %180 = load i32, i32 addrspace(1)* %20, align 4
  %181 = load i32, i32 addrspace(1)* %22, align 8
  %182 = load i32, i32 addrspace(1)* %24, align 4
  %183 = load i32, i32 addrspace(1)* %26, align 8
  %184 = lshr i32 %179, 2
  %185 = xor i32 %184, %179
  %186 = shl i32 %183, 4
  %187 = shl i32 %185, 1
  %188 = xor i32 %187, %186
  %189 = xor i32 %188, %185
  %190 = xor i32 %189, %183
  %191 = add i32 %178, 362437
  %192 = add i32 %190, %191
  %193 = uitofp i32 %192 to float
  %194 = fmul contract float %193, 0x3DF0000000000000
  %195 = fadd contract float %194, 0x3DF0000000000000
  store i32 %191, i32 addrspace(1)* %16, align 8
  store i32 %180, i32 addrspace(1)* %18, align 8
  store i32 %181, i32 addrspace(1)* %20, align 4
  store i32 %182, i32 addrspace(1)* %22, align 8
  store i32 %183, i32 addrspace(1)* %24, align 4
  store i32 %190, i32 addrspace(1)* %26, align 8
  %196 = fmul contract float %195, %36
  %197 = fptosi float %196 to i32
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds float, float addrspace(1)* %0, i64 %198
  %200 = load float, float addrspace(1)* %199, align 4, !tbaa !7
  %201 = fcmp contract oeq float %200, 1.000000e+00
  %202 = select i1 %201, float 0.000000e+00, float 1.000000e+00
  store float %202, float addrspace(1)* %199, align 4, !tbaa !7
  br label %203

203:                                              ; preds = %177, %175, %98, %74
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
