; ModuleID = '../data/hip_kernels/14301/2/main.cu'
source_filename = "../data/hip_kernels/14301/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@array = external hidden local_unnamed_addr addrspace(3) global [0 x i8], align 1

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16kernelBFRSsharedPKfS0_Piiiiif(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6, float %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = mul i32 %15, %14
  %17 = add i32 %16, %9
  %18 = freeze i32 %17
  %19 = icmp ult i32 %18, %5
  br i1 %19, label %20, label %191

20:                                               ; preds = %8
  %21 = getelementptr inbounds i32, i32 addrspace(3)* bitcast ([0 x i8] addrspace(3)* @array to i32 addrspace(3)*), i32 %9
  store i32 0, i32 addrspace(3)* %21, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %22 = urem i32 %18, %4
  %23 = sub nuw i32 %18, %22
  %24 = icmp sgt i32 %4, 0
  br i1 %24, label %25, label %35

25:                                               ; preds = %20
  %26 = sub i32 %22, %6
  %27 = add i32 %22, %6
  %28 = sext i32 %18 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %0, i64 %28
  %30 = icmp sgt i32 %3, 0
  %31 = and i32 %3, 7
  %32 = icmp ult i32 %3, 8
  %33 = and i32 %3, -8
  %34 = icmp eq i32 %31, 0
  br label %39

35:                                               ; preds = %188, %20
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %36 = load i32, i32 addrspace(3)* %21, align 4, !tbaa !7
  %37 = zext i32 %18 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %37
  store i32 %36, i32 addrspace(1)* %38, align 4, !tbaa !7
  br label %191

39:                                               ; preds = %25, %188
  %40 = phi i32 [ 0, %25 ], [ %189, %188 ]
  %41 = icmp slt i32 %40, %26
  %42 = icmp sgt i32 %40, %27
  %43 = or i1 %41, %42
  br i1 %43, label %44, label %188

44:                                               ; preds = %39
  %45 = add i32 %23, %40
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %1, i64 %46
  br i1 %30, label %48, label %182

48:                                               ; preds = %44
  br i1 %32, label %159, label %49

49:                                               ; preds = %48, %49
  %50 = phi i32 [ %156, %49 ], [ 0, %48 ]
  %51 = phi float [ %155, %49 ], [ 0.000000e+00, %48 ]
  %52 = phi i32 [ %157, %49 ], [ 0, %48 ]
  %53 = mul nsw i32 %50, %5
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %29, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !11, !amdgpu.noclobber !6
  %57 = getelementptr inbounds float, float addrspace(1)* %47, i64 %54
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !11, !amdgpu.noclobber !6
  %59 = fsub contract float %58, %56
  %60 = fcmp contract olt float %59, 0.000000e+00
  %61 = fneg contract float %59
  %62 = select contract i1 %60, float %61, float %59
  %63 = fcmp contract olt float %51, %62
  %64 = select contract i1 %63, float %62, float %51
  %65 = or i32 %50, 1
  %66 = mul nsw i32 %65, %5
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %29, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !11, !amdgpu.noclobber !6
  %70 = getelementptr inbounds float, float addrspace(1)* %47, i64 %67
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !11, !amdgpu.noclobber !6
  %72 = fsub contract float %71, %69
  %73 = fcmp contract olt float %72, 0.000000e+00
  %74 = fneg contract float %72
  %75 = select contract i1 %73, float %74, float %72
  %76 = fcmp contract olt float %64, %75
  %77 = select contract i1 %76, float %75, float %64
  %78 = or i32 %50, 2
  %79 = mul nsw i32 %78, %5
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %29, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !11, !amdgpu.noclobber !6
  %83 = getelementptr inbounds float, float addrspace(1)* %47, i64 %80
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !11, !amdgpu.noclobber !6
  %85 = fsub contract float %84, %82
  %86 = fcmp contract olt float %85, 0.000000e+00
  %87 = fneg contract float %85
  %88 = select contract i1 %86, float %87, float %85
  %89 = fcmp contract olt float %77, %88
  %90 = select contract i1 %89, float %88, float %77
  %91 = or i32 %50, 3
  %92 = mul nsw i32 %91, %5
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %29, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !11, !amdgpu.noclobber !6
  %96 = getelementptr inbounds float, float addrspace(1)* %47, i64 %93
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !11, !amdgpu.noclobber !6
  %98 = fsub contract float %97, %95
  %99 = fcmp contract olt float %98, 0.000000e+00
  %100 = fneg contract float %98
  %101 = select contract i1 %99, float %100, float %98
  %102 = fcmp contract olt float %90, %101
  %103 = select contract i1 %102, float %101, float %90
  %104 = or i32 %50, 4
  %105 = mul nsw i32 %104, %5
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %29, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !11, !amdgpu.noclobber !6
  %109 = getelementptr inbounds float, float addrspace(1)* %47, i64 %106
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !11, !amdgpu.noclobber !6
  %111 = fsub contract float %110, %108
  %112 = fcmp contract olt float %111, 0.000000e+00
  %113 = fneg contract float %111
  %114 = select contract i1 %112, float %113, float %111
  %115 = fcmp contract olt float %103, %114
  %116 = select contract i1 %115, float %114, float %103
  %117 = or i32 %50, 5
  %118 = mul nsw i32 %117, %5
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %29, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !11, !amdgpu.noclobber !6
  %122 = getelementptr inbounds float, float addrspace(1)* %47, i64 %119
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !11, !amdgpu.noclobber !6
  %124 = fsub contract float %123, %121
  %125 = fcmp contract olt float %124, 0.000000e+00
  %126 = fneg contract float %124
  %127 = select contract i1 %125, float %126, float %124
  %128 = fcmp contract olt float %116, %127
  %129 = select contract i1 %128, float %127, float %116
  %130 = or i32 %50, 6
  %131 = mul nsw i32 %130, %5
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %29, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !11, !amdgpu.noclobber !6
  %135 = getelementptr inbounds float, float addrspace(1)* %47, i64 %132
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !11, !amdgpu.noclobber !6
  %137 = fsub contract float %136, %134
  %138 = fcmp contract olt float %137, 0.000000e+00
  %139 = fneg contract float %137
  %140 = select contract i1 %138, float %139, float %137
  %141 = fcmp contract olt float %129, %140
  %142 = select contract i1 %141, float %140, float %129
  %143 = or i32 %50, 7
  %144 = mul nsw i32 %143, %5
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %29, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !11, !amdgpu.noclobber !6
  %148 = getelementptr inbounds float, float addrspace(1)* %47, i64 %145
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !11, !amdgpu.noclobber !6
  %150 = fsub contract float %149, %147
  %151 = fcmp contract olt float %150, 0.000000e+00
  %152 = fneg contract float %150
  %153 = select contract i1 %151, float %152, float %150
  %154 = fcmp contract olt float %142, %153
  %155 = select contract i1 %154, float %153, float %142
  %156 = add nuw nsw i32 %50, 8
  %157 = add i32 %52, 8
  %158 = icmp eq i32 %157, %33
  br i1 %158, label %159, label %49, !llvm.loop !13

159:                                              ; preds = %49, %48
  %160 = phi float [ undef, %48 ], [ %155, %49 ]
  %161 = phi i32 [ 0, %48 ], [ %156, %49 ]
  %162 = phi float [ 0.000000e+00, %48 ], [ %155, %49 ]
  br i1 %34, label %182, label %163

163:                                              ; preds = %159, %163
  %164 = phi i32 [ %179, %163 ], [ %161, %159 ]
  %165 = phi float [ %178, %163 ], [ %162, %159 ]
  %166 = phi i32 [ %180, %163 ], [ 0, %159 ]
  %167 = mul nsw i32 %164, %5
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds float, float addrspace(1)* %29, i64 %168
  %170 = load float, float addrspace(1)* %169, align 4, !tbaa !11, !amdgpu.noclobber !6
  %171 = getelementptr inbounds float, float addrspace(1)* %47, i64 %168
  %172 = load float, float addrspace(1)* %171, align 4, !tbaa !11, !amdgpu.noclobber !6
  %173 = fsub contract float %172, %170
  %174 = fcmp contract olt float %173, 0.000000e+00
  %175 = fneg contract float %173
  %176 = select contract i1 %174, float %175, float %173
  %177 = fcmp contract olt float %165, %176
  %178 = select contract i1 %177, float %176, float %165
  %179 = add nuw nsw i32 %164, 1
  %180 = add i32 %166, 1
  %181 = icmp eq i32 %180, %31
  br i1 %181, label %182, label %163, !llvm.loop !15

182:                                              ; preds = %159, %163, %44
  %183 = phi float [ 0.000000e+00, %44 ], [ %160, %159 ], [ %178, %163 ]
  %184 = fcmp contract ugt float %183, %7
  br i1 %184, label %188, label %185

185:                                              ; preds = %182
  %186 = load i32, i32 addrspace(3)* %21, align 4, !tbaa !7
  %187 = add nsw i32 %186, 1
  store i32 %187, i32 addrspace(3)* %21, align 4, !tbaa !7
  br label %188

188:                                              ; preds = %182, %185, %39
  %189 = add nuw nsw i32 %40, 1
  %190 = icmp eq i32 %189, %4
  br i1 %190, label %35, label %39, !llvm.loop !17

191:                                              ; preds = %35, %8
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
!17 = distinct !{!17, !14}
