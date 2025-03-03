; ModuleID = '../data/hip_kernels/14301/3/main.cu'
source_filename = "../data/hip_kernels/14301/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@array = external hidden local_unnamed_addr addrspace(3) global [0 x i8], align 1

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z21kernelBFRSMultisharedPKfS0_PiiiiiS0_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6, float addrspace(1)* nocapture readonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = mul i32 %15, %14
  %17 = add i32 %16, %9
  %18 = udiv i32 %17, %4
  %19 = icmp ult i32 %17, %5
  br i1 %19, label %20, label %194

20:                                               ; preds = %8
  %21 = getelementptr inbounds i32, i32 addrspace(3)* bitcast ([0 x i8] addrspace(3)* @array to i32 addrspace(3)*), i32 %9
  store i32 0, i32 addrspace(3)* %21, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %22 = zext i32 %18 to i64
  %23 = getelementptr inbounds float, float addrspace(1)* %7, i64 %22
  %24 = load float, float addrspace(1)* %23, align 4, !tbaa !11, !amdgpu.noclobber !6
  %25 = mul i32 %18, %4
  %26 = sub i32 %17, %25
  %27 = icmp sgt i32 %4, 0
  br i1 %27, label %28, label %38

28:                                               ; preds = %20
  %29 = sub i32 %26, %6
  %30 = add i32 %26, %6
  %31 = sext i32 %17 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  %33 = icmp sgt i32 %3, 0
  %34 = and i32 %3, 7
  %35 = icmp ult i32 %3, 8
  %36 = and i32 %3, -8
  %37 = icmp eq i32 %34, 0
  br label %42

38:                                               ; preds = %191, %20
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = load i32, i32 addrspace(3)* %21, align 4, !tbaa !7
  %40 = zext i32 %17 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %40
  store i32 %39, i32 addrspace(1)* %41, align 4, !tbaa !7
  br label %194

42:                                               ; preds = %28, %191
  %43 = phi i32 [ 0, %28 ], [ %192, %191 ]
  %44 = icmp slt i32 %43, %29
  %45 = icmp sgt i32 %43, %30
  %46 = or i1 %44, %45
  br i1 %46, label %47, label %191

47:                                               ; preds = %42
  %48 = add i32 %43, %25
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %1, i64 %49
  br i1 %33, label %51, label %185

51:                                               ; preds = %47
  br i1 %35, label %162, label %52

52:                                               ; preds = %51, %52
  %53 = phi i32 [ %159, %52 ], [ 0, %51 ]
  %54 = phi float [ %158, %52 ], [ 0.000000e+00, %51 ]
  %55 = phi i32 [ %160, %52 ], [ 0, %51 ]
  %56 = mul nsw i32 %53, %5
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %32, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !11, !amdgpu.noclobber !6
  %60 = getelementptr inbounds float, float addrspace(1)* %50, i64 %57
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !11, !amdgpu.noclobber !6
  %62 = fsub contract float %61, %59
  %63 = fcmp contract olt float %62, 0.000000e+00
  %64 = fneg contract float %62
  %65 = select contract i1 %63, float %64, float %62
  %66 = fcmp contract olt float %54, %65
  %67 = select contract i1 %66, float %65, float %54
  %68 = or i32 %53, 1
  %69 = mul nsw i32 %68, %5
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %32, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !11, !amdgpu.noclobber !6
  %73 = getelementptr inbounds float, float addrspace(1)* %50, i64 %70
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !11, !amdgpu.noclobber !6
  %75 = fsub contract float %74, %72
  %76 = fcmp contract olt float %75, 0.000000e+00
  %77 = fneg contract float %75
  %78 = select contract i1 %76, float %77, float %75
  %79 = fcmp contract olt float %67, %78
  %80 = select contract i1 %79, float %78, float %67
  %81 = or i32 %53, 2
  %82 = mul nsw i32 %81, %5
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %32, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !11, !amdgpu.noclobber !6
  %86 = getelementptr inbounds float, float addrspace(1)* %50, i64 %83
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !11, !amdgpu.noclobber !6
  %88 = fsub contract float %87, %85
  %89 = fcmp contract olt float %88, 0.000000e+00
  %90 = fneg contract float %88
  %91 = select contract i1 %89, float %90, float %88
  %92 = fcmp contract olt float %80, %91
  %93 = select contract i1 %92, float %91, float %80
  %94 = or i32 %53, 3
  %95 = mul nsw i32 %94, %5
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %32, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !11, !amdgpu.noclobber !6
  %99 = getelementptr inbounds float, float addrspace(1)* %50, i64 %96
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !11, !amdgpu.noclobber !6
  %101 = fsub contract float %100, %98
  %102 = fcmp contract olt float %101, 0.000000e+00
  %103 = fneg contract float %101
  %104 = select contract i1 %102, float %103, float %101
  %105 = fcmp contract olt float %93, %104
  %106 = select contract i1 %105, float %104, float %93
  %107 = or i32 %53, 4
  %108 = mul nsw i32 %107, %5
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %32, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !11, !amdgpu.noclobber !6
  %112 = getelementptr inbounds float, float addrspace(1)* %50, i64 %109
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !11, !amdgpu.noclobber !6
  %114 = fsub contract float %113, %111
  %115 = fcmp contract olt float %114, 0.000000e+00
  %116 = fneg contract float %114
  %117 = select contract i1 %115, float %116, float %114
  %118 = fcmp contract olt float %106, %117
  %119 = select contract i1 %118, float %117, float %106
  %120 = or i32 %53, 5
  %121 = mul nsw i32 %120, %5
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %32, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !11, !amdgpu.noclobber !6
  %125 = getelementptr inbounds float, float addrspace(1)* %50, i64 %122
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !11, !amdgpu.noclobber !6
  %127 = fsub contract float %126, %124
  %128 = fcmp contract olt float %127, 0.000000e+00
  %129 = fneg contract float %127
  %130 = select contract i1 %128, float %129, float %127
  %131 = fcmp contract olt float %119, %130
  %132 = select contract i1 %131, float %130, float %119
  %133 = or i32 %53, 6
  %134 = mul nsw i32 %133, %5
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %32, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !11, !amdgpu.noclobber !6
  %138 = getelementptr inbounds float, float addrspace(1)* %50, i64 %135
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !11, !amdgpu.noclobber !6
  %140 = fsub contract float %139, %137
  %141 = fcmp contract olt float %140, 0.000000e+00
  %142 = fneg contract float %140
  %143 = select contract i1 %141, float %142, float %140
  %144 = fcmp contract olt float %132, %143
  %145 = select contract i1 %144, float %143, float %132
  %146 = or i32 %53, 7
  %147 = mul nsw i32 %146, %5
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %32, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !11, !amdgpu.noclobber !6
  %151 = getelementptr inbounds float, float addrspace(1)* %50, i64 %148
  %152 = load float, float addrspace(1)* %151, align 4, !tbaa !11, !amdgpu.noclobber !6
  %153 = fsub contract float %152, %150
  %154 = fcmp contract olt float %153, 0.000000e+00
  %155 = fneg contract float %153
  %156 = select contract i1 %154, float %155, float %153
  %157 = fcmp contract olt float %145, %156
  %158 = select contract i1 %157, float %156, float %145
  %159 = add nuw nsw i32 %53, 8
  %160 = add i32 %55, 8
  %161 = icmp eq i32 %160, %36
  br i1 %161, label %162, label %52, !llvm.loop !13

162:                                              ; preds = %52, %51
  %163 = phi float [ undef, %51 ], [ %158, %52 ]
  %164 = phi i32 [ 0, %51 ], [ %159, %52 ]
  %165 = phi float [ 0.000000e+00, %51 ], [ %158, %52 ]
  br i1 %37, label %185, label %166

166:                                              ; preds = %162, %166
  %167 = phi i32 [ %182, %166 ], [ %164, %162 ]
  %168 = phi float [ %181, %166 ], [ %165, %162 ]
  %169 = phi i32 [ %183, %166 ], [ 0, %162 ]
  %170 = mul nsw i32 %167, %5
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds float, float addrspace(1)* %32, i64 %171
  %173 = load float, float addrspace(1)* %172, align 4, !tbaa !11, !amdgpu.noclobber !6
  %174 = getelementptr inbounds float, float addrspace(1)* %50, i64 %171
  %175 = load float, float addrspace(1)* %174, align 4, !tbaa !11, !amdgpu.noclobber !6
  %176 = fsub contract float %175, %173
  %177 = fcmp contract olt float %176, 0.000000e+00
  %178 = fneg contract float %176
  %179 = select contract i1 %177, float %178, float %176
  %180 = fcmp contract olt float %168, %179
  %181 = select contract i1 %180, float %179, float %168
  %182 = add nuw nsw i32 %167, 1
  %183 = add i32 %169, 1
  %184 = icmp eq i32 %183, %34
  br i1 %184, label %185, label %166, !llvm.loop !15

185:                                              ; preds = %162, %166, %47
  %186 = phi float [ 0.000000e+00, %47 ], [ %163, %162 ], [ %181, %166 ]
  %187 = fcmp contract ugt float %186, %24
  br i1 %187, label %191, label %188

188:                                              ; preds = %185
  %189 = load i32, i32 addrspace(3)* %21, align 4, !tbaa !7
  %190 = add nsw i32 %189, 1
  store i32 %190, i32 addrspace(3)* %21, align 4, !tbaa !7
  br label %191

191:                                              ; preds = %185, %188, %42
  %192 = add nuw nsw i32 %43, 1
  %193 = icmp eq i32 %192, %4
  br i1 %193, label %38, label %42, !llvm.loop !17

194:                                              ; preds = %38, %8
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
